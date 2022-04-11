//
//  OperationViewController.swift
//  BankApp
//
//  Created by Yuliia Khrupina on 4/10/22.
//

import Foundation
import UIKit
import RealmSwift

class OperationViewController: UIViewController, UITextFieldDelegate {
    
    var operation: Operation = Operation.GetBalance
    
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var phoneInput: UITextField!
    
    let localRealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initRealmForTheFirstStart()
        displayOperationLabel()
        input.delegate = self
        phoneInput.delegate = self
        
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
    
    func initRealmForTheFirstStart() {
        let accountsCount = localRealm.objects(BankAccount.self).count
        if accountsCount == 0 {
            try! localRealm.write {
                localRealm.add(BankAccount())
            }
        }
    }
    
    func textField(_ textField: UITextField,
      shouldChangeCharactersIn range: NSRange,
      replacementString string: String) -> Bool {
      let invalidCharacters =
        CharacterSet(charactersIn: "0123456789").inverted
      return (string.rangeOfCharacter(from: invalidCharacters) == nil)
    }
    
    @IBAction func onActionButtonClick(_ sender: Any) {
        let account = localRealm.objects(BankAccount.self)[0]
        let inputNumber: Int = Int(input.text!) ?? 0
        switch operation {
        case .WithdrawMoney:
            if (account.balance > inputNumber) {
                try! localRealm.write {
                    account.balance -= inputNumber
                }
                showAlert(message: "Transaction completed")
            } else {
                showAlert(message: "Error: Not enough money")
            }
            break
        case .DepositCash:
            try! localRealm.write {
                account.balance += inputNumber
            }
            showAlert(message: "Transaction completed")
            break
        case .TopUpCellPhone:
            let phoneNumber: Int = Int(phoneInput.text!) ?? 0
            if (account.balance > inputNumber) {
                try! localRealm.write {
                    account.balance -= inputNumber
                }
                showAlert(message: "Transaction completed. Phone number \(phoneNumber) balance updated")
            } else {
                showAlert(message: "Error: Not enough money")
            }
            break
        case .GetBalance:
            //Do nothing
            break
        }
    }
    
    func showAlert(message: String) {

            // create the alert
            let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)

            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    
    func hideViews() {
        balanceLabel.isHidden = true
        input.isHidden = true
        actionButton.isHidden = true
        phoneInput.isHidden = true
    }
    
    func showBalanceOnBankDeposit() {
        balanceLabel.isHidden = false
        
        let account = localRealm.objects(BankAccount.self)[0]
        
        balanceLabel.text = "Balance: $\(account.balance)"
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
