//
//  OperationViewController.swift
//  BankApp
//
//  Created by Yuliia Khrupina on 4/10/22.
//

import Foundation
import UIKit

class OperationViewController: UIViewController {
    
    var operation: Operation = Operation.GetBalance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(operation)
        
    }
}
