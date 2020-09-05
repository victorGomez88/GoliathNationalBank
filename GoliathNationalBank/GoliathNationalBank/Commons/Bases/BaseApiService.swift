//
//  BaseApiService.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 05/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

enum REQUESTNAMES : String {
    case RATES = "rates.json"
    case TRANSACTIONS = "transactions.json"
}

public class BaseApiService {

    static let endpoint : String = "http://quiet-stone-2094.herokuapp.com/"
    
    public static func doGetRequest(params: [String:Any]?,
                                               request: String,
                                               success succeed: (@escaping (Any) -> Void),
                                               failure fail: (@escaping () -> Void)) {
        
        Alamofire.request(endpoint + request, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
             switch response.result {
             case .success(let value):
                succeed(value)
                break
             case .failure:
                fail()
                break
                
            }
        }
        
        
//        responseArray(completionHandler: { (response: DataResponse<[T]>) in
//
//                   switch response.result {
//                   case .success(let value):
//                   succeed(value)
//                       break
//                   case .failure:
//                    fail()
//                       break
//
//                   }
//               })
    }
    
    
    
    public static func doPostRequest<T:Codable>(params: [String:Any]?,
                                               request: String,
                                               success succeed: (@escaping (T?) -> Void),
                                               failure fail: (@escaping (T?) -> Void)) {
    }
}
