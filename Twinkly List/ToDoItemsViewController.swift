//
//  ToDoListViewController.swift
//  Twinkly List
//
//  Created by Seref Bulbul on 21/02/2017.
//  Copyright © 2017 Seref Bulbul. All rights reserved.
//

import UIKit
import RxCocoa
import RxDataSources
import RxSwift

class ToDoItemsViewController: BaseViewController {
    
    static let identifier = "ToDoItemsViewController"
    
    @IBOutlet weak var toDosTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    let disposeBag = DisposeBag()
    var viewModel = ToDoItemsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        ToDoItems.shared.items.value = [
            ToDoItem(id: 1, name: "1", isCompleted: false),
            ToDoItem(id: 2, name: "2", isCompleted: false),
            ToDoItem(id: 3, name: "3", isCompleted: false),
            ToDoItem(id: 4, name: "4", isCompleted: false),
            ToDoItem(id: 5, name: "5", isCompleted: false)
        ]
        
        viewModel.toDoItems
            .asObservable()
            .bindTo(toDosTableView
                .rx
                .items(cellIdentifier: ToDosTableViewCell.identifier, cellType: ToDosTableViewCell.self)) {
                    row, toDoItem, cell in
                    cell.configure(withToDo: toDoItem)
            }
            .addDisposableTo(disposeBag)
        
        toDosTableView
        .rx
        .modelSelected(ToDoItem.self)
        .subscribe(onNext: { (toDoItem) in
            let toDoItemDetailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ToDoItemDetailViewController.identifier) as! ToDoItemDetailViewController
            toDoItemDetailViewController.viewModel = ToDoItemDetailViewModel(toDoItem: toDoItem)
            
//            let toDoItemDetailViewController = ToDoItemDetailViewController(viewModel: ToDoItemDetailViewModel(toDoItem: toDoItem))
            
            self.navigationController?.pushViewController(toDoItemDetailViewController, animated: true)
        })
        .addDisposableTo(disposeBag)
        
        addButton
            .rx
            .tap
            .subscribe(onNext: {
                [weak self] in self?.viewModel.addButtonAction()
            })
            .addDisposableTo(disposeBag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
