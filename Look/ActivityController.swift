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
    //@IBOutlet weak var nameTextField: UITextField!
    //var pieceName = "";
    
    //var pieceNames = ["Mona Lisa", "Starry Night", "Boy with Apple"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nameTextField.delegate = self
        
        let randomPieces = [#imageLiteral(resourceName: "Piece1"), #imageLiteral(resourceName: "Piece2"), #imageLiteral(resourceName: "Piece3")]
        randomImage.image = randomPieces[Int(arc4random()) % randomPieces.count]
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        pieceName = textField.text!
        if(pieceNames.index(of: pieceName) != nil) {
            let timerView = self.storyboard?.instantiateViewController(withIdentifier: "TimerController") as? TimerController
            timerView?.stringPassed = pieceName
            self.present(timerView!, animated: true, completion: nil)
        } else {
            textField.text = ""
            textField.becomeFirstResponder()
        }
    }*/
    
    

}

