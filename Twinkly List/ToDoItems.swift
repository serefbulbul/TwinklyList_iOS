//
//  ToDoItems.swift
//  Twinkly List
//
//  Created by Seref Bulbul on 21/02/2017.
//  Copyright © 2017 Seref Bulbul. All rights reserved.
//

import RxSwift

class ToDoItems {
    
    static var shared = ToDoItems()
    var items: Variable<[ToDoItem]> = Variable([])
    var nextId = 0
    
    init() {
//        nextId = Observable.just(items).reduce(nextId, accumulator: { (A, _: [ToDoItem]) -> _; in
//            
//            return A
//        })
    }
    
}
