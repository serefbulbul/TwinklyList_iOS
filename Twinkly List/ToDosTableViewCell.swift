//
//  ToDosTableViewCell.swift
//  Twinkly List
//
//  Created by Seref Bulbul on 21/02/2017.
//  Copyright © 2017 Seref Bulbul. All rights reserved.
//

import UIKit

class ToDosTableViewCell: UITableViewCell {

    static let identifier = "ToDosTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withToDo toDoItem: ToDoItem) {
        guard let name = toDoItem.name else { return }
        
        nameLabel.text = name
    }
    
}
