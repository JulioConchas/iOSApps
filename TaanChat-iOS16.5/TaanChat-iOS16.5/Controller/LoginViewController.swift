//
//  LoginViewController.swift
//  TaanChat-iOS16.5
//
//  Created by Julio Conchas on 17/02/24.
//

import UIKit
import Firebase

class LoginViewController: UIViewController 
{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let EMPTY_STR = "empty"
    
    @IBAction func loginPressed(_ sender: UIButton) 
    {
        Auth.auth().signIn(withEmail: emailTextField.text ?? EMPTY_STR, password: passwordTextField.text ?? EMPTY_STR ) { authResult, error in
            if let e = error
            {
                print("ERROR:LoginViewController:\(e)")
            }
            else
            {
                // No errors, Navigate to ChatViewControler
                self.performSegue(withIdentifier: "LoginToChat", sender: self)
            }
        }
    }
}
