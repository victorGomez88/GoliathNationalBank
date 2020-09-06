//
//  GNBApiServices.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GNBApiServices : NSObject {
    
    public static let sharedInstance = GNBApiServices()
    
    var transactionsList : TransactionsListModel?
    var ratesList : RatesListModel?
    
    func getRates(success: (@escaping (RatesListModel) -> Void),
                  failure: (@escaping () -> Void)){
        
        if self.ratesList == nil {
            BaseApiService.doGetRequest(params: nil,
                                        request: REQUESTNAMES.RATES.rawValue,
                                        success: { response in
                                            self.ratesList = RatesListModel()
                                            self.ratesList?.mapping(response)
                                            
                                            guard let rateList = self.ratesList else { return }
                                            
                                            success(rateList)
            }) {
                failure()
            }
        } else {
            guard let rateList = self.ratesList else { return }
            success(rateList)
        }
        
        
    }
    
    
    func getTransactions(success: (@escaping (TransactionsListModel) -> Void),
                         failure: (@escaping () -> Void)){
        
        if self.transactionsList == nil {
            BaseApiService.doGetRequest(params: nil,
                                        request: REQUESTNAMES.TRANSACTIONS.rawValue,
                                        success: { response in
                                            self.transactionsList = TransactionsListModel()
                                            self.transactionsList?.mapping(response)
                                            
                                            guard let transactionsList = self.transactionsList else { return }
                                            success(transactionsList)
                                            
            }) {
                failure()
            }
        } else {
            guard let transactionsList = self.transactionsList else { return }
            success(transactionsList)
        }
        
    }
}
