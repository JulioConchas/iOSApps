//
//  ViewController.swift
//  FriendsBill-iOS16.6
//
//  Created by Julio Conchas on 03/02/24.
//
// 02/05/2024 Julio Conchas Adding delegate function for TextFields
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    /**
            Default Friend fields only one friend
     */
    @IBOutlet weak var defFriendName: UITextField!
    @IBOutlet weak var defFriendBill: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defFriendBill.delegate = self
        defFriendName.delegate = self
    }

    @IBAction func addFriend(_ sender: UIButton) 
    {
        let friendField = UITextField()
        friendField.placeholder = "Friend Name"
        let moneySign = UILabel()
        moneySign.text = "$"
        let friendBill = UITextField()
        friendBill.placeholder = "Bill"
        
        friendField.frame = CGRect(x: 250, y: 260, width: 190, height: 34)
        moneySign.frame = CGRect(x: 260, y: 260, width: 20, height: 22)
        friendBill.frame = CGRect(x: 270, y: 260, width: 190, height: 34)
        
        view.addSubview(friendField)
        view.addSubview(moneySign)
        view.addSubview(friendBill)
        
        print("adding a new Friend")
    }
    @IBAction func calculateBill(_ sender: UIButton) 
    {
        defFriendName.endEditing(true)
        defFriendBill.endEditing(true)
        print("Calculate Friends bill")

        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) 
    {
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalAmount = defFriendBill.text
        }
    }
    
    /**
            TextField delegate methods
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool 
    {
        textField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""
        {
            return true
        }
        else
        {
            textField.placeholder = "Field cannot be empty"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) 
    {
        // Use defFriendName and bill here to get the split bill
        textField.text = ""
    }
}

