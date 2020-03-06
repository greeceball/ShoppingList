//
//  GroceryItemListTableViewController.swift
//  ShoppingList2
//
//  Created by Colby Harris on 3/6/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import UIKit
import CoreData

class GroceryItemListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GroceryItemController.sharedInstance.fetchedResultsController.delegate = self
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        // Creating the alert
        let alert = UIAlertController(title: "Add item", message: "Please add an item to your shopping list", preferredStyle: .alert)
        // Add a textField
        alert.addTextField(configurationHandler: nil)
        // Create cancel button
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        // Create add button
        let addButton = UIAlertAction(title: "Add", style: .default) { (_) in
            //unwrap our text
            guard let item = alert.textFields?[0].text, item != "" else {return}
            // Call the add function from GroceryItemController
            GroceryItemController.sharedInstance.create(withName: item)
            // Reload tableview
            self.tableView.reloadData()
        }
        // adding our buttons to the alert box
        alert.addAction(cancelButton)
        alert.addAction(addButton)
        //present our alert
        self.present(alert, animated: true)
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

//MARK: - NSFetchedResultsControllerDelegate

extension GroceryItemListTableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    // sets behavior for cells
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        let indexSet = IndexSet(integer: sectionIndex)
        switch type {
        case .insert:
            tableView.insertSections(indexSet, with: .fade)
        case .delete:
            tableView.deleteSections(indexSet, with: .fade)
        default: return
        }
    }
    
    // additional behavior for cells
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath
                else { return }
            tableView.insertRows(at: [newIndexPath], with: .fade)
        case .delete:
            guard let indexPath = indexPath
                else { return }
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .update:
            guard let indexPath = indexPath
                else { return }
            tableView.reloadRows(at: [indexPath], with: .none)
        case .move:
            guard let indexPath = indexPath, let newIndexPath = newIndexPath
                else { return }
            tableView.moveRow(at: indexPath, to: newIndexPath)
        @unknown default:
            fatalError("NSFetchedResultsChangeType has new unhandled cases")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
