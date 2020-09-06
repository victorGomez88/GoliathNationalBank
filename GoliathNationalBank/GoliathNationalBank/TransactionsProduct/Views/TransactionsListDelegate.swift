//
//  TransactionsListDelegate.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 06/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation

protocol TransactionsListDelegate : NSObjectProtocol {
    func displayTransactions(transactions: [TransactionProductModel])
    func obtainTotalTransactions(total: Double)
}
