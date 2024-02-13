//
//  CoinManager.swift
//  ByteCoin-iOS16.5
//
//  Created by Julio Conchas on 13/02/24.
//

import Foundation

protocol CoinManagerDelegate
{
    func didUpdateCoin(coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager
{
    let baseURL = "https://rest.coinapi.io/v1/exchangerate"
    let apiKey = "B137AF7B-1CB2-4CCF-94E7-9A090F1681AC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate : CoinManagerDelegate?
    
    func getCoinPrice(currency: String, fiatCurrency: String)
    {
        let urlString = "\(baseURL)/\(currency)/\(fiatCurrency)?apikey=\(apiKey)"
        //print(urlString)
        performRequest(urlString: urlString)
    }
    func performRequest(urlString: String)
    {
        //1.- Create a URL
        if let url = URL(string: urlString)
        {
            // 2.- Create a URLSession
            let session = URLSession(configuration: .default)
            // 3.- Give the session a task (as a Closure)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let e = error
                {
                    print(e)
                    return
                }
                if let safeData = data
                {
                    if let coin = self.parseJSON(priceData: safeData)
                    {
                        self.delegate?.didUpdateCoin(coinManager: self, coin: coin)
                    }
                }
            }
            // 4.- Start the task
            task.resume()
        }
    }
    func parseJSON(priceData: Data) -> CoinModel?
    {
        let decoder = JSONDecoder()
        do
        {
            let decodeData = try decoder.decode(CoinData.self, from: priceData)
            let coin = CoinModel(fiatCurrency: decodeData.asset_id_quote, price: decodeData.rate)
            return coin
        }
        catch
        {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
