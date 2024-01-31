//
//  SecondViewController.swift
//  BMI-Calculator-iOS16.5
//
//  Created by Julio Conchas on 23/01/24.
//  This view is an example of how to build a new ViewController without use Segues, building UI manually, it's not being used for this proyect 
//
import UIKit

class SecondViewController : UIViewController
{
    var bmiValue = "0.0"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 500)
        view.addSubview(label)
    }
}
