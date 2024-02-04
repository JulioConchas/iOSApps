//
//  ResultViewController.swift
//  FriendsBill-iOS16.6
//
//  Created by Julio Conchas on 03/02/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    var totalAmount : String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalAmount
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }


}
