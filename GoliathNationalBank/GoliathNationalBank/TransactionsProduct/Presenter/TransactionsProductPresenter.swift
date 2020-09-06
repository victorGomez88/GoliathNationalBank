//
//  TransactionsProductPresenter.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation

class TransactionsProductPresenter {
    
    private let service : TransactionsProductsDataSource
    weak private var transactionsDelegate : TransactionsListDelegate?
    
    init(service: TransactionsProductsDataSource, delegate: TransactionsListDelegate) {
        self.service = service
        self.transactionsDelegate = delegate
    }
    
    
    /// Obtain all transactions
    /// - Parameter product: Product name (SKU) to obtain transactions
    func obtainTransactionsList(product: String){
        
        self.service.getRates(success: { (ratesList) in
            
            CurrencyConverterUtil.groupedConversors(rates: ratesList)
            
            self.service.getTransactions(success: { (transationsList) in
                
                self.transactionsDelegate?.obtainTotalTransactions(total: self.obtainTotalAmountOfTransactions(product: product, transactions: transationsList))
                
                self.transactionsDelegate?.displayTransactions(transactions: self.obtainTransactionsByProduct(product: product, transactions: transationsList))
            }) {
                //Failure response actions
            }
        }) {
           //Failure response actions
        }
        
        
    }
    
    /// Return transaction of a single product
    /// - Parameter product: Product to filter transactions
    /// - Parameter transactions: List of all transactions
    func obtainTransactionsByProduct(product: String, transactions: TransactionsListModel) -> [TransactionProductModel] {
        
        var transactionsProductList : [TransactionProductModel] = []
        
        let groupedTransactions = Dictionary(grouping: transactions.transactionsList ?? [], by: { ($0.transaction) })
        
        groupedTransactions[product]?.forEach { transaction in
            transactionsProductList.append(TransactionProductModel(transaction: transaction))
        }
        
        return transactionsProductList
    }
    
    /// Return sum amounts of all transactions of the same product
    /// - Parameter product: Product to obtain its transactions
    /// - Parameter transactions: List of all transactions of all products
    func obtainTotalAmountOfTransactions(product: String, transactions: TransactionsListModel) -> Double {
        
        let transactions = self.obtainTransactionsByProduct(product: product, transactions: transactions)
        
        var sum : Double = 0
        
        transactions.forEach { (transaction) in
            sum += transaction.amount ?? 0.00
        }
        
        return sum
    }
    
}
