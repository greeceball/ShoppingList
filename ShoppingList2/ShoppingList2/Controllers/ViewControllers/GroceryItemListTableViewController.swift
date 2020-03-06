//
//  GroceryItemListTableViewController.swift
//  ShoppingList2
//
//  Created by Colby Harris on 3/6/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import UIKit

class GroceryItemListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GroceryItemController.sharedInstance.fetchedResultsController.fetchedObjects?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let groceryItem = GroceryItemController.sharedInstance.fetchedResultsController.object(at: indexPath)
        
        cell.textLabel?.text = groceryItem.itemName

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let itemToDelete = GroceryItemController.sharedInstance.fetchedResultsController.object(at: indexPath)
            
            GroceryItemController.sharedInstance.delete(groceryItem: itemToDelete)
        }
    }
}
