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
    
    var count = 1
    var clock: Timer!
    //@IBOutlet weak var gradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.text = String(count)
        clock = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TimerController.decrementCounter), userInfo: nil, repeats: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    

    func decrementCounter() {
        if(count != 1) {
            count -= 1
            timer.text = String(count)
        } else {
            clock!.invalidate()
            let emotionView = self.storyboard?.instantiateViewController(withIdentifier: "EmotionController") as! EmotionController
            self.present(emotionView, animated: true, completion: nil)
        }
    }

}
