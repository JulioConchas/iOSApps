//
//  RegisterViewController.swift
//  FriendsBill-iOS16.6
//
//  Created by Julio Conchas on 18/02/24.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerBtn(_ sender: Any)
    {
        if let email = emailTextField.text, let pwd = pwdTextField.text
        {
            Auth.auth().createUser(withEmail: email, password: pwd) { authResult, error in
                if let e = error
                {
                    print("ERROR:RegisterViewController: \(e)")
                }
                else
                {
                    // No errors, Navigate to CalculatorView
                    self.performSegue(withIdentifier: Constants.REGISTER_TO_CALCULATOR_SEGUE, sender: self)
                }
            }
        }
    }
}
