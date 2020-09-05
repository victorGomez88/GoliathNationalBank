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
    
    func getRates(success: (@escaping ([RatesModel]) -> Void),
                  failure: (@escaping () -> Void)){
        
        BaseApiService.doGetRequest(params: nil,
                                    request: REQUESTNAMES.RATES.rawValue,
                                    outputClass: RatesModel(),
                                    success: { response in
                                        
                                        success(response)
//                                        for rate in response {
//                                            print("From: " + (rate.currencyFrom ?? ""))
//                                            print("To: " + (rate.currencyTo ?? ""))
//                                            print("Rate: " + (rate.rate ?? ""))
//                                        }
        }) {
            failure()
        }
    }
    
    
    func getTransactions(success: (@escaping ([TransactionsModel]) -> Void),
                         failure: (@escaping () -> Void)){
        
        BaseApiService.doGetRequest(params: nil,
                                    request: REQUESTNAMES.TRANSACTIONS.rawValue,
                                    outputClass: TransactionsModel(),
                                    success: { response in
                                        
                                        success(response)
                                        
        }) {
            failure()
        }
        
    }
}
