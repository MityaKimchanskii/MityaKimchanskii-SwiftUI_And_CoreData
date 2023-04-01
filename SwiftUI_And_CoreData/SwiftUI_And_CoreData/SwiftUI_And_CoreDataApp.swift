//
//  SwiftUI_And_CoreDataApp.swift
//  SwiftUI_And_CoreData
//
//  Created by Mitya Kim on 3/31/23.
//

import SwiftUI

@main
struct SwiftUI_And_CoreDataApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
