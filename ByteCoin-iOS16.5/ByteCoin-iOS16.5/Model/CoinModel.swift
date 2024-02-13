//
//  CoinModel.swift
//  ByteCoin-iOS16.5
//
//  Created by Julio Conchas on 13/02/24.
//

import Foundation

struct CoinModel
{
    let fiatCurrency: String
    let price : Double
    
    func strPrice() -> String
    {
        return String(format: "%.2f", self.price)
    }
}

