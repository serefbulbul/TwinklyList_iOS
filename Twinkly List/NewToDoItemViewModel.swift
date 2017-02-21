//
//  NewToDoItemViewModel.swift
//  Twinkly List
//
//  Created by Seref Bulbul on 21/02/2017.
//  Copyright © 2017 Seref Bulbul. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

protocol NewToDoItemViewModelProtocol {
    
    func completeButtonAction()
}

class NewToDoItemViewModel: NewToDoItemViewModelProtocol {
    
    let disposeBag = DisposeBag()
    
    var toDoItem: Variable<ToDoItem> = Variable(ToDoItem())
    
    var name: Variable<String> = Variable("")
    
    func completeButtonAction() {
        
    }
}
