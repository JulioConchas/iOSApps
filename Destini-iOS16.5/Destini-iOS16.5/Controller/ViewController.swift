//
//  ViewController.swift
//  Destini-iOS16.5
//
//  Created by Julio Conchas on 06/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sotryLabel: UILabel!
    @IBOutlet weak var choseOneButton: UIButton!
    @IBOutlet weak var choseTwoButton: UIButton!
    
    var storyHandler = Story()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sotryLabel.text = storyHandler.getStory(storyNum:0).title
        setTitles(story:storyHandler.getStory(storyNum:0))
    }
    @IBAction func choiceMade(_ sender: UIButton) 
    {
        let nextStory = storyHandler.nextStory(userChoice: sender.titleLabel!.text!)
        sotryLabel.text = nextStory.title
        setTitles(story: nextStory)
    }
    
    
    func setTitles(story: Historias)
    {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Marker Felt Wide", size: 20)!,
        ]
        
        //choseOneButton.setTitle(choice1, for: .normal)
        let attributedButtonOne = NSAttributedString(string: story.choiceOne, attributes: attributes)
        choseOneButton.setAttributedTitle(attributedButtonOne, for: .normal)
        //choseTwoButton.setTitle(choice2, for: .normal)
        let attributedButtonTwo = NSAttributedString(string: story.choiceTwo, attributes: attributes)
        choseTwoButton.setAttributedTitle(attributedButtonTwo, for: .normal)
        
    }

}

