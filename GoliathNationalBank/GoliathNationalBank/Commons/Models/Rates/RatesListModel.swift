//
//  RatesListModel.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import ObjectMapper

class RatesListModel : NSObject{
    
    var ratesList : [RateModel]?

    func mapping(_ response: Any) {
        self.ratesList = Mapper<RateModel>().mapArray(JSONObject:response)
    }
    
}

