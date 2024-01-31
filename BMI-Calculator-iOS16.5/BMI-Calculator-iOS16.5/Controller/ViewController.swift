//
//  ViewController.swift
//  BMI-Calculator-iOS16.5
//
//  Created by Julio Conchas on 07/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmi = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSladerChange(_ sender: UISlider) 
    {
        heightLabel.text = "\(String(format:"%.2f",sender.value))m"
        // print(String(format:"%.2f", sender.value))
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) 
    {
        weightLabel.text = "\(Int(sender.value))kg"
        // print(Int(sender.value))
    }
    /*
     * BMI = Weight(kg)/Heigth(m)2
     */
    @IBAction func calculatePressed(_ sender: UIButton)
    {
        let heigth = heightSlider.value
        let weight = weightSlider.value
        
        // print("IBM = \(String(format:"%.2f",(weight/pow(heigth,2))))")
        bmi = String(format:"%.1f",(weight/pow(heigth,2)))
        
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format:"%.1f",(weight/pow(heigth,2)))
//        self.present(secondVC, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) 
    {
        if segue.identifier == "goToResult"
        {
            let desticationVC = segue.destination as! ResultsViewController // Downcasting, ! means force Downcast
            desticationVC.bmiValue = bmi
        }
    }
}

