//
//  VerticalSlider.swift
//  Look
//
//  Created by Thomas Clavelli on 5/31/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class VerticalSlider: UIView, UIGestureRecognizerDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var parent: ActivityController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(sender:)))
        pan.delegate = self
        addGestureRecognizer(pan)
    }
    
    var dy: CGFloat = 0
    var rect: CGRect?
    var color = UIColor.white
    
    override func draw(_ rect: CGRect) {
        let rad = rect.width / 2
        self.rect = rect
        let verticalLine = UIBezierPath(roundedRect: CGRect(x: (rect.minX + rect.midX)/2, y: rect.minY, width: rad, height: rect.height), cornerRadius: rad)
        UIColor.gray.set()
        verticalLine.fill()
        let center = CGPoint(x: rect.midX, y: dy + rect.minY + rad)
        let path = UIBezierPath(arcCenter: center, radius: rad/2, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        color.set()
        path.lineWidth = 25
        path.stroke()
    }
    
    var isMoving = false;
    
    func handlePan(sender: UIPanGestureRecognizer) {
        let newY = sender.translation(in: self).y
        if sender.state == .began && newY < rect!.width {
            isMoving = true
        }
        
        if isMoving && sender.state == .changed && newY < rect!.height - rect!.width && newY > 0 {
            dy = newY
            if dy > rect!.height - 1.5*rect!.width {
                color = UIColor.green
            } else {
                color = UIColor.white
            }
            setNeedsDisplay()
        }
        if sender.state == .ended {
            isMoving = false
            if newY > rect!.height - 1.5*rect!.width {
                parent?.startActivity(UIButton())
            } else {
                dy = 0
                setNeedsDisplay()
            }
        }
    }
}
