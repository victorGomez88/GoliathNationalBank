//
//  ProductModel.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 06/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation

class ProductModel {
    
    var productName : String?
    var prodructTransactionsList : TransactionsListModel = TransactionsListModel()
    
    init(productName: String, transactions: [TransactionModel]) {
        self.productName = productName
        self.prodructTransactionsList.transactionsList = transactions
    }
}
