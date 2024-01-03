//
//  ViewController.swift
//  EggTimer
//
//  Created by Julio Conchas on 20/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 3, "Medium": 4, "Hard": 7]
    
    @IBOutlet weak var TopLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton)
    {
        timer.invalidate()
        progressBar.setProgress(0, animated: true)
        
        let hardness = sender.titleLabel!.text!
        totalTime = eggTimes[hardness]!
        secondsPassed = 0
        TopLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
       
    }
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            let porcentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.setProgress(porcentageProgress, animated: true)
        }
        else
        {
            timer.invalidate()
            TopLabel.text = "DONE!"
        }
    }
}

