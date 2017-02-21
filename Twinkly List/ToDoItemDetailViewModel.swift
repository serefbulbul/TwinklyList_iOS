//
//  ToDoItemDetailViewModel.swift
//  Twinkly List
//
//  Created by Seref Bulbul on 21/02/2017.
//  Copyright © 2017 Seref Bulbul. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

protocol ToDoItemDetailViewModelProtocol {
    
    func nameChanged(name: String?)
    func segmentedControlChanged(index: Int)
    func editButtonAction()
}

class ToDoItemDetailViewModel: ToDoItemDetailViewModelProtocol {
    
    let disposeBag = DisposeBag()
    
    let toDoItem: ToDoItem!
    
    var toDoItemVariable: Variable<ToDoItem> = Variable(ToDoItem())
    
    init(toDoItem: ToDoItem) {
        self.toDoItem = toDoItem
    }
    
    func nameChanged(name: String?) {
        if let name = name {
            toDoItem.name = name
        } else {
            toDoItem.name = ""
        }
    }
    
    func segmentedControlChanged(index: Int) {
        index == 0 ? (toDoItem.isCompleted = true) : (toDoItem.isCompleted = false)
    }
    
    func editButtonAction() {
        ToDoItems.shared.items.value = ToDoItems.shared.items.value.map {
            if $0.id == self.toDoItem.id {
                $0.name = self.toDoItem.name
                $0.isCompleted = self.toDoItem.isCompleted
            }
            
            return $0
        }
    }
}
