//
//  CurrencyConverterUtil.swift
//  GoliathNationalBank
//
//  Created by Victor Gomez on 06/09/2020.
//  Copyright © 2020 Victor Gomez. All rights reserved.
//

import Foundation


class CurrencyConverterUtil {
    
    static var groupedRates : Dictionary<String,[RateModel]>?
    
    /// Conversion of amount to EUR
    /// - Parameter amount: amount of transaction
    /// - Parameter currency: currency of transaction
    static func converterCurrency(amount: Double, currency: String) -> Double {
        
        var amountConverted : Double = amount
        
        if !(self.groupedRates?.isEmpty ?? false) {
            if currency != "EUR" {
                if self.groupedRates?[currency]?.contains(where: { (rateModel) -> Bool in
                    rateModel.currencyTo == "EUR"
                }) ?? false {
                    self.groupedRates?[currency]?.forEach({ (rateModel) in
                        if rateModel.currencyTo  == "EUR" {
                            guard let rateAmount = Double(rateModel.rate ?? "") else { return }
                            
                            amountConverted = amount * rateAmount
                        }
                    })
                } else {
                    if let rateAmount = Double(self.groupedRates?[currency]?.first?.rate ?? "") {
                        amountConverted = amount * rateAmount
                        
                        return self.converterCurrency(amount: amountConverted, currency: self.groupedRates?[currency]?.first?.currencyTo ?? "")
                    }
                }
            }
        }
        return amountConverted
    }
    
    /// Grouped rates by currency from
    /// - Parameter rates: List of all rates
    static func groupedConversors(rates: RatesListModel) {
        
        self.groupedRates = Dictionary(grouping: rates.ratesList ?? [], by: { ($0.currencyFrom ?? "") })
        
    }
}
