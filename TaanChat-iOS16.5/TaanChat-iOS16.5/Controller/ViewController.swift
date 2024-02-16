//
//  ViewController.swift
//  TaanChat-iOS16.5
//
//  Created by Julio Conchas on 14/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Animation for titile
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "📣 T'aan"
        for letter in titleText
        {
            // timer Closure
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }


}

