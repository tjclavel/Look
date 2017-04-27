//
//  PieceNameController.swift
//  Look
//
//  Created by Thomas Clavelli on 4/26/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class PieceNameController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var label: UILabel!
    
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
        label.text! += textfield.text!
    }

}