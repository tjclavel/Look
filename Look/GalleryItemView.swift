//
//  GalleryItemView.swift
//  Look
//
//  Created by Thomas Clavelli on 4/28/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class GalleryItemView: UIView {

    var paths: [[CGPoint]] = []
    var color = UIColor.black
    var lineWidth = CGFloat(30)
    
    func drawPath(_ myPoints: [CGPoint]) {
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
        path.stroke(with: CGBlendMode.normal, alpha: 0.5)
    }
    
    override func draw(_ rect: CGRect) {
        color.set()
        for path in paths {
            drawPath(path)
        }
    }

}
