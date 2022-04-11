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
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var phoneInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayOperationLabel()
        
        switch operation {
        case .GetBalance:
            hideViews()
            showBalanceOnBankDeposit()
            break
        case .WithdrawMoney:
            hideViews()
            showWithdrawMoneyUi()
            break
        case .DepositCash:
            hideViews()
            showDepositCashUi()
            break
        case .TopUpCellPhone:
            hideViews()
            showTopUpCellPhoneUi()
            break
        }
    }
    
    @IBAction func onActionButtonClick(_ sender: Any) {
        
    }
    
    func hideViews() {
        balanceLabel.isHidden = true
        input.isHidden = true
        actionButton.isHidden = true
        phoneInput.isHidden = true
    }
    
    func showBalanceOnBankDeposit() {
        balanceLabel.isHidden = false
        balanceLabel.text = "Balance: $100"
    }
    
    func showWithdrawMoneyUi() {
        input.isHidden = false
        actionButton.isHidden = false
        actionButton.setTitle("Withdraw Money", for: .normal)
    }
    
    func showDepositCashUi() {
        input.isHidden = false
        actionButton.isHidden = false
        actionButton.setTitle("Deposit Cash", for: .normal)
    }
    
    func showTopUpCellPhoneUi() {
        input.isHidden = false
        phoneInput.isHidden = false
        phoneInput.placeholder = "Phone number"
        actionButton.isHidden = false
        actionButton.setTitle("Topup cell phone", for: .normal)
    }
    
    func displayOperationLabel() {
        let operationName: String
        switch operation {
        case .GetBalance:
            operationName = "displaying the balance on a bank deposit"
            break
        case .WithdrawMoney:
            operationName = "cash withdrawal from a bank deposit"
            break
        case .DepositCash:
            operationName = "replenishment of the bank deposit in cash"
            break
        case .TopUpCellPhone:
            operationName = "replenishment of the phone balance from the deposit"
            break
        }
        
        operationLabel.text = "Operation: \(operationName)"
    }
}
