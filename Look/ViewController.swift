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
    //@IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
//        button.titleLabel?.textAlignment = NSTextAlignment.center
//        button.setTitle("Start Visit\n▼", for: .normal)
    }
    
    /* Persist Data */
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        //defaults.removeObject(forKey: "hasBeenLoaded")
        let hasBeenLoaded = defaults.bool(forKey: "hasBeenLoaded")
        if(!hasBeenLoaded) {
            defaults.set(true, forKey: "hasBeenLoaded")
            let tutorial = self.storyboard?.instantiateViewController(withIdentifier: "Tutorial")
            self.present(tutorial!, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
