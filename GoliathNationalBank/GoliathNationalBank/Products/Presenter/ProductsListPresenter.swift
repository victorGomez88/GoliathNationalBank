//
//  ProductsListPresenter.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation

class ProductsListPresenter {
    
    private let service : ProductsDataSource
    weak private var productDelegate : ProductsViewDelegate?
    
    init(service: ProductsDataSource, delegate: ProductsViewDelegate) {
        self.service = service
        self.productDelegate = delegate
    }
    
    
    func obtainProductList() {
        
        self.service.getTransactions(success: { (transationsList) in
            
            self.productDelegate?.displayProducts(products: self.groupTransactactionByProduct(transactions: transationsList))
            
        }) {
            //Failure response actions
        }
    }
    
    //Grouping all transactions by Transaction Name and creating new ProductsModels
    func groupTransactactionByProduct(transactions: TransactionsListModel) -> [ProductModel]{
        
        var productsList : [ProductModel] = []
        
        let groupedTransactions = Dictionary(grouping: transactions.transactionsList ?? [], by: { ($0.transaction ?? "") })
        
        groupedTransactions.forEach { transaction in
            productsList.append(ProductModel(productName: transaction.key, transactions: transaction.value))
        }
        
        
        return productsList
    }
}
