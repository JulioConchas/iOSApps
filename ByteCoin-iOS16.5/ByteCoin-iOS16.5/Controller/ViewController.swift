//
//  ViewController.swift
//  ByteCoin-iOS16.5
//
//  Created by Julio Conchas on 12/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManger = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        coinManger.delegate = self
    }
}

// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int 
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int 
    {
        return coinManger.currencyArray.count
    }
    
    
}
// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? 
    {
        return coinManger.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) 
    {
        print(coinManger.currencyArray[row])
        coinManger.getCoinPrice(currency: "BTC", fiatCurrency: coinManger.currencyArray[row])
    }
}
// MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate
{
    func didUpdateCoin(coinManager: CoinManager, coin: CoinModel)
    {
        DispatchQueue.main.async
        {
            self.bitcoinLabel.text = coin.strPrice()
            self.currencyLabel.text = coin.fiatCurrency
        }
        
    }
    func didFailWithError(error: Error)
    {
        print(error)
    }
}

