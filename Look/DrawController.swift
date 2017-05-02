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
    var color: UIColor? = UIColor.cyan
    @IBOutlet weak var drawView: DrawView!
    
    var savedPaths = [[[CGPoint]]]()
    var savedColors = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clock = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(DrawController.decrementCounter), userInfo: nil, repeats: true)
            drawView.color = color
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
        if(count < 350) {
            count += 1
            drawView.count = count
            drawView.setNeedsDisplay()
        } else {
            clock?.invalidate()
            let pieceNameView = self.storyboard?.instantiateViewController(withIdentifier: "PieceNameView") as! PieceNameController
            drawView.savePath()
            var paths = drawView.getPaths()
            if paths[paths.count-1].count == 0 {
                paths.remove(at: paths.count-1)
            }
            savedPaths.append(paths)
            savedColors.append(color!)
            pieceNameView.savedPaths = savedPaths
            pieceNameView.savedColors = savedColors
            self.present(pieceNameView, animated: true, completion: nil)
        }
    }

}
