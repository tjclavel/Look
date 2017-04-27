//
//  DrawController.swift
//  Look
//
//  Created by Thomas Clavelli on 4/1/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class DrawController: UIViewController {
    
    var count = 0
    var clock: Timer?
    @IBOutlet weak var drawView: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clock = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(DrawController.decrementCounter), userInfo: nil, repeats: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        drawView.addPoint(sender.location(in: drawView))
        if(sender.state == UIGestureRecognizerState.ended) {
            drawView.savePath();
        }
        drawView.setNeedsDisplay()
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        drawView.addPoint(sender.location(in: drawView))
        drawView.savePath()
        drawView.setNeedsDisplay()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func decrementCounter() {
        if(count < 500) {
            count += 1
            drawView.count = count
            drawView.setNeedsDisplay()
        } else {
            clock?.invalidate()
            let pieceNameView = self.storyboard?.instantiateViewController(withIdentifier: "PieceNameView")
            self.present(pieceNameView!, animated: true, completion: nil)
        }
    }

}
