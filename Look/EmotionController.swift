//
//  EmotionController.swift
//  Look
//
//  Created by Thomas Clavelli on 4/26/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class EmotionController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var drawButton: UIButton!
    
    var color = UIColor.cyan
    
    //var emotion = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        textfield.layer.zPosition = 1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //emotion = textField.text!
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let drawView = self.storyboard?.instantiateViewController(withIdentifier: "DrawController") as! DrawController
        drawView.color = color
        self.present(drawView, animated: false, completion: nil)
    }
    
    @IBAction func editingDidChange(_ sender: UITextField) {
        color = getColor(from: textfield.text!)
//        if color != UIColor.cyan {
//            drawButton.setTitleColor(color, for: .normal)
//            textfield.textColor = color
//        } else {
//            drawButton.setTitleColor(UIColor.black, for: .normal)
//            textfield.textColor = UIColor.black
//        }
        drawButton.setTitleColor(color, for: .normal)
        textfield.textColor = color
    }
    
    func getColor(from emotion: String) -> UIColor {
        let str = emotion.lowercased()
        let hash = str.hashValue
        return UIColor(colorLiteralRed: Float(hash % 7907) / Float(7907), green: Float(hash % 4657) / Float(4657), blue: Float(hash % 2069) / Float(2069), alpha: 1)
    }
    
    

}
