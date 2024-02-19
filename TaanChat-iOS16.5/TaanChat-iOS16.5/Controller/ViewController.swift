//
//  ViewController.swift
//  TaanChat-iOS16.5
//
//  Created by Julio Conchas on 14/02/24.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: - Animation for title manually
//        titleLabel.text = ""
//        var charIndex = 0.0
//        let titleText = "📣 T'aan"
//        for letter in titleText
//        {
//            // timer Closure
//            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            charIndex += 1
//        }
        // MARK: - Animation for title using cocopods and external library
        titleLabel.text = Constants.APP_NAME
    }


}

