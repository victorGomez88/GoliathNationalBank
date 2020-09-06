//
//  TransactionsListModel.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import ObjectMapper

class TransactionsListModel : NSObject {
    
    var transactionsList : [TransactionModel]? = []

    func mapping(_ response: Any) {
        self.transactionsList = Mapper<TransactionModel>().mapArray(JSONObject:response)
    }
    
}
