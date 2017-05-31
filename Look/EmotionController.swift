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
    
    var savedPaths = [[[CGPoint]]]()
    var savedColors = [UIColor]()
    var color = UIColor.cyan
    
    //var emotion = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        let border = CALayer()
        let width = CGFloat(2)
//        border.borderColor = UIColor.black.cgColor
//        border.frame = CGRect(x: 0, y: textfield.frame.size.height - width, width:  textfield.frame.size.width, height: textfield.frame.size.height)
//        border.borderWidth = width
//        textfield.layer.addSublayer(border)
//        textfield.layer.masksToBounds = true
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
        drawView.savedPaths = savedPaths
        drawView.savedColors = savedColors
        self.present(drawView, animated: false, completion: nil)
    }
    
    @IBAction func editingDidChange(_ sender: UITextField) {
        color = getColor(from: textfield.text!)
        if color != UIColor.cyan {
            drawButton.setTitleColor(color, for: .normal)
            textfield.textColor = color
        } else {
            drawButton.setTitleColor(UIColor.black, for: .normal)
            textfield.textColor = UIColor.black
        }
    }
    
    func getColor(from emotion: String) -> UIColor {
        let emotionL = emotion.lowercased()
        if(emotionL == "sad") {
            return UIColor.blue
        } else if(emotionL == "happy") {
            return UIColor.yellow
        } else if(emotionL == "confused") {
            return UIColor.orange
        } else if(emotionL == "excited") {
            return UIColor.green
        } else if(emotionL == "scared") {
            return UIColor.red
        } else if(emotionL == "brave") {
            return UIColor.magenta
        }
        return UIColor.cyan
    }

}
