//
//  CoreDataStack.swift
//  ShoppingList2
//
//  Created by Colby Harris on 3/6/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import Foundation
import CoreData
enum CoreDataStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ShoppingList2")
        container.loadPersistentStores { (storeDescroption, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
