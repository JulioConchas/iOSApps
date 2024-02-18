//
//  ChatViewController.swift
//  TaanChat-iOS16.5
//
//  Created by Julio Conchas on 17/02/24.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "📣 T'aan"
        navigationItem.hidesBackButton = true

    }
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) 
    {
        do 
        {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch let signOutError as NSError
        {
            print("Error signing out: %@",signOutError)
        }
    }
}
