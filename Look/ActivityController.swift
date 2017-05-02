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
    
    var savedPaths = [[[CGPoint]]]()
    var savedColors = [UIColor]()
    
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
            let timerView = self.storyboard?.instantiateViewController(withIdentifier: "TimerController") as! TimerController
            timerView.savedPaths = savedPaths
            timerView.savedColors = savedColors
            self.present(timerView, animated: true, completion: nil)
        }
    }

    @IBAction func exitMuseum(_ sender: UIButton) {
        let gallery = self.storyboard?.instantiateViewController(withIdentifier: "Gallery") as! DisplayController
        gallery.savedPaths = savedPaths
        gallery.savedColors = savedColors
        self.present(gallery, animated: true, completion: nil)
    }
}
