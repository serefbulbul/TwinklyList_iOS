//
//  ToDoListViewModel.swift
//  Twinkly List
//
//  Created by Seref Bulbul on 21/02/2017.
//  Copyright © 2017 Seref Bulbul. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

protocol ToDoItemsViewModelProtocol {
    
    func addButtonAction()
}

class ToDoItemsViewModel: ToDoItemsViewModelProtocol {

    let disposeBag = DisposeBag()
    
    var toDoItems: Variable<[ToDoItem]> = Variable([])
    
    init() {
        ToDoItems.shared.items
            .asObservable()
        .subscribe(onNext: { (toDoItems) in
            self.toDoItems.value = toDoItems
        })
        .addDisposableTo(disposeBag)
    }
    
    func addButtonAction() {
        let toDoItem = ToDoItem()
        toDoItem.name = "asdasd"
        toDoItem.isCompleted = false
        
        toDoItems.value.append(toDoItem)
    }
}
