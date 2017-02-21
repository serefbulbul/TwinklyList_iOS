//
//  ToDoItemDetailViewController.swift
//  Twinkly List
//
//  Created by Seref Bulbul on 21/02/2017.
//  Copyright © 2017 Seref Bulbul. All rights reserved.
//

import UIKit
import RxCocoa
import RxDataSources
import RxSwift

class ToDoItemDetailViewController: BaseViewController {
    
    static let identifier = "ToDoItemDetailViewController"
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var completedSegmentedControl: UISegmentedControl!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    let disposeBag = DisposeBag()
    var viewModel: ToDoItemDetailViewModel!
    
    convenience init(viewModel: ToDoItemDetailViewModel) {
        self.init()
        
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.nameTextField.text = viewModel.toDoItem.name
        self.completedSegmentedControl.selectedSegmentIndex = viewModel.toDoItem.isCompleted == true ? 0 : 1
        
        self.nameTextField
            .rx
            .text
            .subscribe(onNext: { (name) in
                self.viewModel.nameChanged(name: name)
            })
            .addDisposableTo(disposeBag)
        
        completedSegmentedControl
            .rx
            .selectedSegmentIndex
            .subscribe(onNext: { self.viewModel.segmentedControlChanged(index: $0) })
            .addDisposableTo(disposeBag)
        
        editButton
            .rx
            .tap
            .subscribe(onNext: {
                self.viewModel.editButtonAction()
                _ = self.navigationController?.popViewController(animated: true)
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
