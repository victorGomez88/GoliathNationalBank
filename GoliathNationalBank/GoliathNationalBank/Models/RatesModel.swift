//
//  RatesModel.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import ObjectMapper

class RatesModel : Mappable {
    
    var currencyFrom : String?
    var currencyTo : String?
    var rate : String?

    init(){}
    
    required init?(map: Map) {
    }
    
     func mapping(map: Map) {
        self.currencyFrom  <- map["from"]
        self.currencyTo  <- map["to"]
        self.rate  <- map["rate"]
    }
}
