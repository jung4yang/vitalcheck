//
//  SwiftUIView.swift
//  vitalcheck
//
//  Created by junga yang on 2024/05/06.
//

import Foundation
import CoreData

public class DataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "BloodPressureDataModel")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Error loading Core Data stores: \(error)")
            }
        })
    }
    
    func saveBloodPressure(systolic: Int16, diastolic: Int16) {
        let newRecord = BloodPressureData(context: persistentContainer.viewContext)
        newRecord.systolicPressure = systolic
        newRecord.diastolicPressure = diastolic
        newRecord.timestamp = Date()
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            fatalError("Error saving blood pressure data: \(error)")
        }
    }
    
    func fetchBloodPressureData() -> [BloodPressureData] {
        let request: NSFetchRequest<BloodPressureData> = BloodPressureData.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "timestamp", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            return result
        } catch {
            fatalError("Error fetching blood pressure data: \(error)")
        }
    }
}
