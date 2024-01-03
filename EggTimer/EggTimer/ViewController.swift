//
//  ViewController.swift
//  EggTimer
//
//  Created by Julio Conchas on 20/12/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer!
    let eggTimes = ["Soft" : 3, "Medium": 4, "Hard": 7]
    
    @IBOutlet weak var TopLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton)
    {
        timer.invalidate()
        progressBar.setProgress(0, animated: false)
        
        let hardness = sender.titleLabel!.text!
        totalTime = eggTimes[hardness]!
        secondsPassed = 0
        TopLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
       
    }
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let porcentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.setProgress(porcentageProgress, animated: true)
        }
        else
        {
            timer.invalidate()
            playSound()
            TopLabel.text = "DONE!"
        }
    }
    func playSound()
    {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

