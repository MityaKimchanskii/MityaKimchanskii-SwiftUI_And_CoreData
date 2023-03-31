//
//  PersistentController.swift
//  SwiftUI_And_CoreData
//
//  Created by Mitya Kim on 3/30/23.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    
    static let shared = PersistenceController()
    
    // Convenience
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        // Companies
        let newCompany = Company(context: viewContext)
        newCompany.name = "Apple"
        
        shared.saveContext()
        
        return result
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Intro") // else UnsafeRawBufferPointer with negative count
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "dev/null")
        }
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    // Save context
    func saveContext() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Error \(error.localizedDescription)")
            }
        }
    }
}
