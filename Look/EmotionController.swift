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
    var emotion = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
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
        //let drawView = self.storyboard?.instantiateViewController(withIdentifier: "DrawController")
        //drawView.color! = getColor(from: textField.text!)
        //self.present(drawView!, animated: false, completion: nil)
        emotion = textField.text!
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let drawView = self.storyboard?.instantiateViewController(withIdentifier: "DrawController") as! DrawController
        drawView.color = getColor(from: emotion)
        self.present(drawView, animated: false, completion: nil)
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
