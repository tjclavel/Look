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
    var color = UIColor.cyan
    var delay: Timer?
    //var started = false
    
    //@IBOutlet weak var label: UILabel!
    @IBOutlet weak var drawView: DrawView!
    
    var savedPaths = [[[CGPoint]]]()
    var savedColors = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.bringSubview(toFront: label)
        //delay = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(DrawController.startDrawing), userInfo: nil, repeats: false)
        drawView.color = color
        
        /* */
        clock = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(DrawController.decrementCounter), userInfo: nil, repeats: true)
    }
    
    func startDrawing() {
        //started = true
        //label.removeFromSuperview()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        //if started {
            drawView.addPoint(sender.location(in: drawView))
            if(sender.state == UIGestureRecognizerState.ended) {
                drawView.savePath();
            }
            drawView.setNeedsDisplay()
        //}
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        //if started {
            drawView.addPoint(sender.location(in: drawView))
            drawView.savePath()
            drawView.setNeedsDisplay()
        //}
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
            savedColors.append(color)
            pieceNameView.savedPaths = savedPaths
            pieceNameView.savedColors = savedColors
            let defaults = UserDefaults.standard
            //defaults.removeObject(forKey: "sketches")
            //defaults.removeObject(forKey: "colors")
            defaults.removeObject(forKey: "titles")
            var pieces = defaults.array(forKey: "sketches")
            if(pieces == nil) {
                pieces = [[[[CGFloat]]]]()
            }
            var pieces2 = [[[CGFloat]]]()
            for i in 0..<paths.count {
                pieces2.append([[CGFloat]]())
                for j in 0..<paths[i].count {
                    pieces2[i].append([CGFloat]())
                    pieces2[i][j] = [paths[i][j].x, paths[i][j].y]
                }
            }
            pieces?.append(pieces2)
            defaults.set(pieces, forKey: "sketches")
            var colors = defaults.array(forKey: "colors")
            if(colors == nil) {
                colors = [[CGFloat]]()
            }
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            color.getRed(&red, green: &green, blue: &blue, alpha: nil)
            colors?.append([red, green, blue])
            defaults.set(colors, forKey: "colors")
            self.present(pieceNameView, animated: true, completion: nil)
        }
    }

}
