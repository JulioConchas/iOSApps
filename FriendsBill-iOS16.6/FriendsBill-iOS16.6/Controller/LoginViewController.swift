//
//  LoginViewController.swift
//  FriendsBill-iOS16.6
//
//  Created by Julio Conchas on 18/02/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginBtn(_ sender: UIButton) 
    {
        if let email = emailTextField.text , let pwd = pwdTextField.text
        {
            Auth.auth().signIn(withEmail: email, password: pwd) { authResult, error in
                if let e = error
                {
                    print("ERROR:LoginViewController:\(e)")
                }
                else
                {
                    // No errors, Navigate to calculator
                    self.performSegue(withIdentifier: Constants.LOGIN_TO_CALCULATOR_SEGUE, sender: self)
                }
            }
        }
    }
}
