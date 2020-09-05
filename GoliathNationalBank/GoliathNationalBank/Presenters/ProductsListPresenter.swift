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
    
    init(service: GNBServices) {
        self.service = service
    }
    
    func obtainProductList() {
        self.service.getTransactions(success: { (response) in
            for transaction in response {
                print("Transaction: " + (transaction.transaction ?? ""))
                print("Amount: " + (transaction.amount ?? ""))
                print("Currency: " + (transaction.currency ?? ""))
            }
        }) {
            //Failure response actions
        }
    }
}
