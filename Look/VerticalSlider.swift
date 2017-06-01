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
    
    var isMoving = false
    let offset: CGFloat = 2
    var rad: CGFloat = 0
    var height: CGFloat = 0
    var centerY: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
//        let rad = rect.width / 2
//        self.rect = rect
//        let verticalLine = UIBezierPath(roundedRect: CGRect(x: (rect.minX + rect.midX)/2, y: rect.minY, width: rad, height: rect.height), cornerRadius: rad)
//        UIColor.gray.set()
//        verticalLine.fill()
//        let center = CGPoint(x: rect.midX, y: topY + rad/2)
//        let path = UIBezierPath(arcCenter: center, radius: rad/2, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
//        color.set()
//        path.lineWidth = 25
//        path.stroke()
        height = rect.height
        rad = rect.width/3
        if centerY == 0 {
            centerY = rad+offset
        }
        let verticalLine = UIBezierPath(roundedRect: CGRect(x: rad/2, y: 0, width: rect.width*4/6, height: rect.height), cornerRadius: rect.width)
        UIColor(colorLiteralRed: 0.67, green: 0.67, blue: 0.67, alpha: 1).set()
        verticalLine.fill()
        let path = UIBezierPath(arcCenter: CGPoint(x: 3*rad/2, y: centerY), radius: rad+2, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        UIColor.white.set()
        path.fill()
        
        /*CGContextRef context = UIGraphicsGetCurrentContext()
        
        CGContextAddPath(context, path.CGPath)
        CGContextSetLineWidth(context, 2.0)
        CGContextSetBlendMode(context, path.blendMode)
        CGContextSetShadowWithColor(context, CGSizeMake(1.0, 1.0), 2.0, [UIColor blackColor].CGColor)
        CGContextStrokePath(context)*/
        //path.fill()
    }
    
    func handlePan(sender: UIPanGestureRecognizer) {
        let y = sender.location(in: self).y
        if sender.state == .began && y < rad*2+4 {
            isMoving = true
        }
        if isMoving && sender.state == .changed && y > rad + 2 && y < height - rad - 2 {
            centerY = y
            setNeedsDisplay()
        } else if isMoving && y < rad + 2 {
            centerY = rad + 2
            setNeedsDisplay()
        } else if isMoving && y > height - rad - 2 {
            centerY = height - rad - 2
            setNeedsDisplay()
        }
        if isMoving && sender.state == .ended {
            isMoving = false
            if y > 4/5 * height {
                parent?.startActivity(UIButton())
            } else {
                centerY = 0
                setNeedsDisplay()
            }
        }
        
    }
}
