//
//  ViewController.swift
//  Look
//
//  Created by Thomas Clavelli on 2/8/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class ActivityController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var randomImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomPieces = [#imageLiteral(resourceName: "Piece1"), #imageLiteral(resourceName: "Piece2"), #imageLiteral(resourceName: "Piece3")]
        randomImage.image = randomPieces[Int(arc4random()) % randomPieces.count]
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if(motion == .motionShake) {
            let timerView = self.storyboard?.instantiateViewController(withIdentifier: "TimerController")
            self.present(timerView!, animated: true, completion: nil)
        }
    }

}

