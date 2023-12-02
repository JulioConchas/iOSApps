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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dadoImageViewOne.image = UIImage(imageLiteralResourceName: "DadoSeis")
        dadoImageViewOne.alpha = 0.5
        dadoImageViewTwo.image = UIImage(imageLiteralResourceName: "DadoDos")
    }


}

