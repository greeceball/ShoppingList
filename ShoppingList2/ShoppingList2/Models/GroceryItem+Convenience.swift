//
//  GroceryItem+Convenience.swift
//  ShoppingList2
//
//  Created by Colby Harris on 3/6/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import Foundation
import CoreData

extension GroceryItem {
    convenience init(itemName: String, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.itemName = itemName
    }
}
