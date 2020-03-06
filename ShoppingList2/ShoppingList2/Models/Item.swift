//
//  Item.swift
//  ShoppingList2
//
//  Created by Colby Harris on 3/6/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import Foundation

class Item {
  
  var itemName: String
  var uuid: UUID = UUID()
  
    init(itemName: String, isComplete: Bool = false) {
    self.itemName = itemName
  }
}

extension Item: Equatable {
  static func == (lhs: Item, rhs: Item) -> Bool {
    return lhs.uuid == rhs.uuid
  }
}
