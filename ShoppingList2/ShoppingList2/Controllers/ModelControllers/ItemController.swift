//
//  ItemController.swift
//  ShoppingList2
//
//  Created by Colby Harris on 3/6/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import Foundation

class ItemController {
    
    //MARK: - Properties
    
    static let sharedItem = ItemController()
    var items = [Item]()
    
    // MARK: - CRUD Methods
    func add(itemName: String) {
      let item = Item(itemName: itemName)
      items.append(item)
    }
    
    func delete(item: Item) {
      guard let index = items.firstIndex(of: item) else { return }
      items.remove(at: index)
    }
}
