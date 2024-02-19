//
//  RegisterViewController.swift
//  TaanChat-iOS16.5
//
//  Created by Julio Conchas on 17/02/24.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController
{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func registerPressed(_ sender: UIButton) 
    {
        Auth.auth().createUser(withEmail: emailTextField.text ?? Constants.EMPTY_STR, password: passwordTextField.text ?? Constants.EMPTY_STR) { authResult, error in
            if let e = error
            {
                print("ERROR:RegisterViewController:\(e.localizedDescription)")
            }
            else
            {
                // No errors, Navigate to ChatViewControler
                self.performSegue(withIdentifier: Constants.REGISTER_SEGUE, sender: self)
            }
        }
    }
}
