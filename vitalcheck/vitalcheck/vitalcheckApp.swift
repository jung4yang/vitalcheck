//
//  vitalcheckApp.swift
//  vitalcheck
//
//  Created by junga yang on 2024/05/05.
//

import SwiftUI

@main
struct vitalcheckApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
