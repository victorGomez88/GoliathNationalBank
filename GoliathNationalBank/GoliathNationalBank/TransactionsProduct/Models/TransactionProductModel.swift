//
//  TransactionsProductModel.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 06/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation

class TransactionProductModel {
    
    var amount : Double?
    var currency : String?
    
    init(transaction: TransactionModel) {
        self.amount = Double(transaction.amount ?? "")
        self.currency = transaction.currency
    }
}
