//
//  ProductsDataSource.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 06/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ProductsDataSource {

    func getTransactions(success: (@escaping (TransactionsListModel) -> Void),
                         failure: (@escaping () -> Void)){
        
        GNBApiServices.sharedInstance.getTransactions(success: { (transactionsList) in
            success(transactionsList)
        }) {
            failure()
        }
        
    }
}
