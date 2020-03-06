//
//  ButtonTableViewCell.swift
//  ShoppingList2
//
//  Created by Colby Harris on 3/6/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var completeButton: UIButton!
    
    var isComplete: Bool = false
    //MARK: - Actions
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        isComplete != isComplete
        updateButton(isComplete)
        
    }

    func updateButton(_ isComplete: Bool) {
        let image = isComplete ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        completeButton.setImage(image, for: .normal)
    }

}

extension ButtonTableViewCell {
    func update(withItem itemName: GroceryItem) {
        self.nameLabel.text = itemName.itemName
        updateButton(isComplete)
    }
}
