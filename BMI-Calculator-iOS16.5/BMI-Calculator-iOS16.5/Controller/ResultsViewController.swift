//
//  ResultsViewController.swift
//  BMI-Calculator-iOS16.5
//
//  Created by Julio Conchas on 23/01/24.
//

import UIKit

class ResultsViewController: UIViewController 
{

    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    var bmiValue : String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
    }
    

    @IBAction func recalculate(_ sender: UIButton) 
    {
        // Return to the main view
        self.dismiss(animated: true, completion: nil)
    }

}
