//
//  TimerController.swift
//  Look
//
//  Created by Thomas Clavelli on 3/31/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class TimerController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    var stringPassed = ""
    var count = 30
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //label.text = self.value(forKey: "pieceName") as! String?
        label.text = stringPassed
        timer.text = String(count)
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TimerController.decrementCounter), userInfo: nil, repeats: true)
    }

    

    func decrementCounter() {
        if(count != 0) {
            count -= 1
            timer.text = String(count)
        } else {
            let drawView = self.storyboard?.instantiateViewController(withIdentifier: "drawController")
            self.present(drawView!, animated: true, completion: nil)
        }
    }

}
