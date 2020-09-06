//
//  GNBServices.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GNBServices {
    
    func getRates(success: (@escaping (RatesListModel) -> Void),
                  failure: (@escaping () -> Void)){
        
        BaseApiService.doGetRequest(params: nil,
                                    request: REQUESTNAMES.RATES.rawValue,
                                    success: { response in
                                        
                                        let ratesList = RatesListModel()
                                        ratesList.mapping(response)
                                        success(ratesList)
                             
        }) {
            failure()
        }
    }
    
    
    func getTransactions(success: (@escaping (TransactionsListModel) -> Void),
                         failure: (@escaping () -> Void)){
        
        BaseApiService.doGetRequest(params: nil,
                                    request: REQUESTNAMES.TRANSACTIONS.rawValue,
                                    success: { response in
                                        let transactionsList = TransactionsListModel()
                                        transactionsList.mapping(response)
                                        
                                        success(transactionsList)
                                        
        }) {
            failure()
        }
        
    }
}
