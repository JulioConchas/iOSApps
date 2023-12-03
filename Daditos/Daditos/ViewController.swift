//
//  ViewController.swift
//  Daditos
//
//  Created by Julio Conchas on 30/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dadoImageViewOne: UIImageView!
    @IBOutlet weak var dadoImageViewTwo: UIImageView!
    
    // let means constant
//    let dadosArray = ["DadoUno","DadoDos","DadoTres","DadoCuatro","DadoCinco","DadoSeis"]
    let dadosArray = ["DadoUno3D","DadoDos3D","DadoTres3D","DadoCuatro3D","DadoCinco3D","DadoSeis3D"]
//    var countDiceOne = 0
//    var countDiceTwo = 5

//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        
//       // dadoImageViewOne.image = UIImage(imageLiteralResourceName: "DadoSeis")
//       // dadoImageViewOne.alpha = 0.5
//        //dadoImageViewTwo.image = UIImage(imageLiteralResourceName: "DadoDos")
//    }

    @IBAction func btnRoll(_ sender: UIButton) 
    {
//        print("1.- countDiceOne: \(countDiceOne), countDiceTwo: \(countDiceTwo)")
//        dadoImageViewOne.image = UIImage(imageLiteralResourceName: dadosArray[countDiceOne])
//        dadoImageViewTwo.image = UIImage(imageLiteralResourceName: dadosArray[countDiceTwo])
//        
//        if countDiceOne == 5
//        {
//            countDiceOne = 0
//        }
//        else
//        {
//            countDiceOne += 1
//        }
//        if countDiceTwo == 0
//        {
//            countDiceTwo = 5
//        }
//        else
//        {
//            countDiceTwo -= 1
//        }
//        print("2.- countDiceOne: \(countDiceOne), countDiceTwo: \(countDiceTwo)")
        
        // Dice selection using randomization
        // Option 1
//        dadoImageViewOne.image = UIImage(imageLiteralResourceName: dadosArray[Int.random(in: 0...5)])
//        dadoImageViewTwo.image = UIImage(imageLiteralResourceName: dadosArray[Int.random(in: 0...5)])
        // Option 2, most provide a default value in case null element
        dadoImageViewOne.image = UIImage(imageLiteralResourceName: dadosArray.randomElement()!)
        dadoImageViewTwo.image = UIImage(imageLiteralResourceName: dadosArray.randomElement()!)
    }
    
}

