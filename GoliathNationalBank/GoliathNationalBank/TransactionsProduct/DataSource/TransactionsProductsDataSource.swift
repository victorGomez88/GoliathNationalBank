//
//  TransactionsProductsDataSource.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 06/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class TransactionsProductsDataSource {

    func getTransactions(success: (@escaping (TransactionsListModel) -> Void),
                         failure: (@escaping () -> Void)){
        
        GNBApiServices.sharedInstance.getTransactions(success: { (transactionsList) in
            success(transactionsList)
        }) {
            failure()
        }
        
    }
    
    func getRates(success: (@escaping (RatesListModel) -> Void),
                  failure: (@escaping () -> Void)) {
        GNBApiServices.sharedInstance.getRates(success: { (ratesList) in
                   success(ratesList)
               }) {
                   failure()
               }
    }
}
