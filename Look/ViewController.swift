//
//  ViewController.swift
//  Look
//
//  Created by Thomas Clavelli on 4/26/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.setTitle("Start Visit\n▼", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
