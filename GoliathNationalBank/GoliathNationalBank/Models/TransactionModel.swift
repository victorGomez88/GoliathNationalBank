//
//  TransactionModel.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import ObjectMapper

class TransactionModel : Mappable {
    
    var transaction : String?
    var amount : String?
    var currency : String?
    
    init(){}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.transaction  <- map["sku"]
        self.amount  <- map["amount"]
        self.currency  <- map["currency"]
    }
}
