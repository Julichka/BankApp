//
//  Model.swift
//  BankApp
//
//  Created by Yuliia Khrupina on 4/10/22.
//

import Foundation
import RealmSwift

enum Operation {
    case GetBalance
    case WithdrawMoney
    case DepositCash
    case TopUpCellPhone
}

class BankAccount : Object {
    @Persisted var balance: Float = 0
}
