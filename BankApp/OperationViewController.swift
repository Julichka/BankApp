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
    
    @IBOutlet weak var operationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayOperationLabel()
    }
    
    func displayOperationLabel() {
        let operationName: String
        switch operation {
        case .GetBalance:
            operationName = "displaying the balance on a bank deposit"
        case .WithdrawMoney:
            operationName = "cash withdrawal from a bank deposit"
        case .DepositCash:
            operationName = "replenishment of the bank deposit in cash"
        case .TopUpCellPhone:
            operationName = "replenishment of the phone balance from the deposit"
        }
        
        operationLabel.text = "Operation: \(operationName)"
    }
}
