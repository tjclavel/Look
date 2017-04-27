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
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func drawPath(_ myPoints: [CGPoint]) {
        let color:UIColor = UIColor.yellow
        
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
        color.set()
        path.lineWidth = 30
        path.lineCapStyle = CGLineCap.round
        path.lineJoinStyle = CGLineJoin.round
        path.stroke(with: CGBlendMode.normal, alpha: 0.5)
    }
    
    override func draw(_ rect: CGRect) {
        
        //UIColor.blue.setStroke()
        //path.stroke()
        
        //let drect = CGRect(x: points[points.count-1].x,y: points[points.count-1].y,width: 10,height: 10)
        //let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        //color.set()
        //bpath.stroke()
        //print(String(describing: points))
        
        for savedPath in savedPoints {
            drawPath(savedPath)
        }
        drawPath(points)
//
//        let color:UIColor = UIColor.yellow
//        
//        let path = UIBezierPath()
//        if(points.count >= 1) {
//            path.move(to: points[0])
//            for i in 1..<(points.count) {
//                path.addLine(to: points[i])
//            }
//        }
//        color.set()
//        path.lineWidth = 40
//        path.stroke(with: .luminosity, alpha: 1.0)
//        path.stroke()
        
        let width = bounds.width
        let height = bounds.height
        let perimeter = 2*(width + height)
        let path = UIBezierPath()
        let len = CGFloat(count) / 500 * perimeter
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
        UIColor.black.set()
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

}
