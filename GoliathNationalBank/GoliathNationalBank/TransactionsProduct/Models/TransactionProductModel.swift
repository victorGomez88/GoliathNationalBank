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
    
    init(transaction: TransactionModel) {
        
        guard let transactionAmount = Double(transaction.amount ?? "") else {return}
        
        self.amount = CurrencyConverterUtil.converterCurrency(amount:transactionAmount, currency: transaction.currency ?? "")
        
    }
}
