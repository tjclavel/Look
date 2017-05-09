//
//  DrawView.swift
//  Look
//
//  Created by Thomas Clavelli on 4/25/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class DrawView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var count = 0
    var points = [CGPoint]()
    var savedPoints = [[CGPoint]]()
    var color: UIColor!
    var lineWidth = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func drawPath(_ myPoints: [CGPoint]) {
        
        color.set()
        
        var path = UIBezierPath()
        if(myPoints.count == 1) {
            path = UIBezierPath(arcCenter: myPoints[0], radius: CGFloat(0), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi*2), clockwise: true)
        } else {
            if(myPoints.count >= 1) {
                path.move(to: myPoints[0])
                for i in 1..<(myPoints.count) {
                    path.addLine(to: myPoints[i])
                }
            }
        }
        path.lineWidth = CGFloat(lineWidth)
        path.lineCapStyle = CGLineCap.round
        path.lineJoinStyle = CGLineJoin.round
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        
        for savedPath in savedPoints {
            drawPath(savedPath)
        }
        drawPath(points)
        
        let width = bounds.width
        let height = bounds.height
        let perimeter = 2*(width + height)
        let path = UIBezierPath()
        let len = CGFloat(count) / 350 * perimeter
        path.move(to: CGPoint(x: 0, y: 0))
        if(len > width) {
            path.addLine(to: CGPoint(x: width, y: 0))
            if(len > height + width) {
                path.addLine(to: CGPoint(x: width, y: height))
                if(len > height + 2*width) {
                    path.addLine(to: CGPoint(x: 0, y: height))
                    path.addLine(to: CGPoint(x: 0, y: perimeter - len))
                } else {
                    path.addLine(to: CGPoint(x: perimeter - len - height, y: height))
                }
            } else {
                path.addLine(to: CGPoint(x: width, y: len - width))
            }
        }
        else {
            path.addLine(to: CGPoint(x: len, y: 0))
        }
        path.lineWidth = 20
        path.stroke()
        
    }
    
    func addPoint(_ point: CGPoint) {
        points.append(point)
    }
    
    func savePath() {
        savedPoints.append(points)
        points = [CGPoint]()
    }
    
    func getPaths()->[[CGPoint]] {
        savePath()
        return savedPoints
    }
    
    func getColor()->UIColor {
        return color!
    }

}
