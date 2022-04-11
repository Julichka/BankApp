//
//  ViewController.swift
//  BankApp
//
//  Created by Yuliia Khrupina on 4/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        guard let identifier = segue.identifier else { return }
        guard let dest = segue.destination as? OperationViewController else { return }
        
        if identifier == "get_balance" {
            dest.operation = Operation.GetBalance
        } else if identifier == "withdraw_money" {
            dest.operation = Operation.WithdrawMoney
        } else if identifier == "deposit_cash" {
            dest.operation = Operation.DepositCash
        } else if identifier == "topup_cell_phone" {
            dest.operation = Operation.TopUpCellPhone
        }
    }


}

