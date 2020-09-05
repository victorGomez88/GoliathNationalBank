//
//  ProductsListPresenter.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation

class ProductsListPresenter {
    
    private let service : GNBServices
    weak private var productDelegate : ProductsViewDelegate?
    
    init(service: GNBServices, delegate: ProductsViewDelegate) {
        self.service = service
        self.productDelegate = delegate
    }
    
    
    func obtainProductList() {
        self.service.getTransactions(success: { (transationsList) in
            
            for transaction in transationsList.transactionsList ?? [] {
                print("Transaction: " + (transaction.transaction ?? ""))
                print("Amount: " + (transaction.amount ?? ""))
                print("Currency: " + (transaction.currency ?? ""))
            }
            
            self.productDelegate?.displayProducts()
            
        }) {
            //Failure response actions
        }
    }
}
