//
//  ActivityController.swift
//  Look
//
//  Created by Thomas Clavelli on 2/8/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class ActivityController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var slider: VerticalSlider!
    
    var curPic = 0
    var clock: Timer!
    var pieces = [Int]()
    
    var pics = Dictionary(dictionaryLiteral: (1, "#13"),
    (2, "1946"),
    (3, "at the lake, morning"),
    (4, "barrier"),
    (5, "before, again IV"),
    (6, "berkeley #26"),
    (7, "black pipe"),
    (8, "burn and glitter"),
    (9, "canton lady"),
    (10, "chain gang"),
    (11, "denial"),
    (12, "dutch landscape"),
    (13, "erdnase"),
    (14, "exit"),
    (15, "fall 1971"),
    (16, "figure 8"),
    (17, "fulcrum"),
    (18, "full time"),
    (19, "girl on the beach"),
    (20, "glass cube"),
    (21, "guy in the dunes"),
    (22, "hadrians court I"),
    (23, "half a dam"),
    (24, "hans bricker in the tropics"),
    (25, "heteroclitus"),
    (26, "hoarding my frog food"),
    (27, "homage to philip guston"),
    (28, "homage to the square, diffused"),
    (29, "horse"),
    (30, "ill hegemann 30"),
    (31, "inversion x"),
    (32, "invocation"),
    (33, "italian no. 3"),
    (34, "italian summer"),
    (35, "january 1971"),
    (36, "killyboffin"),
    (37, "largo-may"),
    (38, "lebron"),
    (39, "lux lovely"),
    (40, "mouse cup"),
    (41, "nude in environment I"),
    (42, "number 64"),
    (43, "oakland maquette"),
    (44, "ocean park #60"),
    (45, "pair of steel chairs"),
    (46, "pendulum"),
    (47, "plum"),
    (48, "plumb bob"),
    (49, "reclining nude"),
    (50, "red ascending"),
    (51, "rose"),
    (52, "serpentine"),
    (53, "sinking brick plates"),
    (54, "spear form, ember"),
    (55, "spoke"),
    (56, "stage #2 with bed"),
    (57, "step wedge"),
    (58, "summer image (for my mother)"),
    (59, "telestich"),
    (60, "the beauborg"),
    (61, "the coat III"),
    (62, "the tale"),
    (63, "this pair"),
    (64, "timeless clock"),
    (65, "transfiguration III"),
    (66, "untitled (alexander)"),
    (67, "untitled (dill)"),
    (68, "untitled (irwin)"),
    (69, "untitled (mccracken)"),
    (70, "untitled I"),
    (71, "untitled standing figure"),
    (72, "untitled V"),
    (73, "votto"),
    (74, "wall painting No. IV"),
    (75, "wend"),
    (76, "woman standing-pink"),
    (0, "zeltweg"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        clock = Timer.scheduledTimer(timeInterval: 1.8, target: self, selector: #selector(ActivityController.switchPhoto), userInfo: nil, repeats: true)
//        for i in 0..<pics.count {
//            pieces.append(i)
//        }
//        randomizeList()
//        image.image = UIImage(named: pics[curPic]!)
//        curPic += 1
//        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
//        button.titleLabel?.textAlignment = NSTextAlignment.center
//        button.setTitle("▲\nEnd Visit", for: .normal)
        slider.parent = self
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func exitMuseum(_ sender: UIButton) {
        let gallery = self.storyboard?.instantiateViewController(withIdentifier: "Gallery") as! DisplayController
        self.present(gallery, animated: true, completion: nil)
    }
    
//    func randomizeList() {
//        for i in 0..<pieces.count {
//            let temp = pieces[i]
//            let rand = Int(arc4random()) % pieces.count
//            pieces[i] = pieces[rand]
//            pieces[rand] = temp
//        }
//    }
    
//    func switchPhoto() {
//        if curPic == pieces.count {
//            curPic = 0
//            randomizeList()
//        }
//        let transition = CATransition()
//        transition.duration = 0.45
//        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        transition.type = kCATransitionFade
//        image.layer.add(transition, forKey: nil)
//        image.image = UIImage(named: pics[pieces[curPic]]!)
//        curPic += 1
//    }
    
    @IBAction func startActivity(_ sender: Any) {
        let timerView = self.storyboard?.instantiateViewController(withIdentifier: "TimerController") as! TimerController
        self.present(timerView, animated: true, completion: nil)
    }
    
    
}
