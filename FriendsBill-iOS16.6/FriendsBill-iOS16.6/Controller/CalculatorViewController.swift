//
//  ViewController.swift
//  FriendsBill-iOS16.6
//
//  Created by Julio Conchas on 03/02/24.
//

import UIKit

class CalculatorViewController: UIViewController {

    /**
            Default Friend fields only one friend
     */
    @IBOutlet weak var defFriendName: UITextField!
    @IBOutlet weak var defFriendBill: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        print("Calculate Friends bill")
        print("Friend name: \(defFriendName.text) , $\(defFriendBill.text)")
    }
    
}

