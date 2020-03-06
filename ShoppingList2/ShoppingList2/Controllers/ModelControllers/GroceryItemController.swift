//
//  GroceryItemController.swift
//  ShoppingList2
//
//  Created by Colby Harris on 3/6/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import Foundation
import CoreData

class GroceryItemController {
    
    //MARK: - Properties
    static let sharedInstance = GroceryItemController()
    
    var fetchedResultsController: NSFetchedResultsController<GroceryItem>
    
    init() {
        let fetchRequest: NSFetchRequest<GroceryItem> = GroceryItem.fetchRequest()
        //might not need this
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "itemName", ascending: true)]
        
        let resultsController: NSFetchedResultsController<GroceryItem> = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(" There was an error fetching data .... , ", error.localizedDescription)
        }
    }
    //MARK: - CRUD methods
    
    func create() {
        
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error saving data: \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
