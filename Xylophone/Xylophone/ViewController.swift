//
//  ViewController.swift
//  Xylophone
//
//  Created by Julio Conchas on 10/12/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func keyPressed(_ sender: UIButton) 
    {
//        print("background : \(sender.backgroundColor)")
//        print("Title : \(sender.titleLabel?.text)")
//        print("Current Title : \(sender.currentTitle)") // this one returns nil
        playSound(title:(sender.titleLabel?.text)!)
        
        // reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }
    
//    func playSound()
//    {
//        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }
//        do
//        {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//            /*
//             The following line is required for the player to work on iOS 11. Change the file type accordingly
//             */
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//            
//            /*
//             iOS 10 and earlier require the following line:
//             player = try AVAudioPlayer(contentsOf: url, FileTypeHint: AVFileTypeMPEGLayer3(
//             */
//            
//            guard let player = player else { return }
//            
//            player.play()
//        }
//        catch let error
//        {
//            print(error.localizedDescription)
//        }
//    }
    func playSound(title: String)
    {
        let url = Bundle.main.url(forResource: title, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

