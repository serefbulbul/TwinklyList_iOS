//
//  ToDoItem.swift
//  Twinkly List
//
//  Created by Seref Bulbul on 21/02/2017.
//  Copyright © 2017 Seref Bulbul. All rights reserved.
//

class ToDoItem {
    
    var id: Int?
    var name: String?
    var isCompleted: Bool?
    
    init() {
        
    }
    
    init(id: Int, name: String, isCompleted: Bool) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
    
}
