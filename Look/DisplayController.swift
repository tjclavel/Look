//
//  DisplayController.swift
//  Look
//
//  Created by Thomas Clavelli on 4/27/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class DisplayController: UIViewController, UIGestureRecognizerDelegate {
    

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    var savedPaths = [[[CGPoint]]]()
    var savedColors = [UIColor]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        button.layer.zPosition = 1
        let defaults = UserDefaults.standard
        let allPaths = defaults.array(forKey: "sketches") as! [[[[CGFloat]]]]
        savedPaths = [[[CGPoint]]]()
        for i in 0..<allPaths.count {
            savedPaths.append([[CGPoint]]())
            for j in 0..<allPaths[i].count {
                savedPaths[i].append([CGPoint]())
                for k in 0..<allPaths[i][j].count {
                    savedPaths[i][j].append(CGPoint(x: allPaths[i][j][k][0], y: allPaths[i][j][k][1]))
                }
            }
        }
        savedColors = [UIColor]()
        let allColors = defaults.array(forKey: "colors") as! [[CGFloat]]
        for i in 0..<allColors.count {
            savedColors.append(UIColor(colorLiteralRed: Float(allColors[i][0]), green: Float(allColors[i][1]), blue: Float(allColors[i][2]), alpha: 1))
        }
        let width = scrollView.bounds.midX
        print(width)
        let height = width//scrollView.bounds.midY
        for i in 0..<savedPaths.count {
            var x: CGFloat = 0
            if i % 2 == 0 {
                x = scrollView.bounds.minX
            } else {
                x = scrollView.bounds.midX
            }
            let y = scrollView.bounds.minY + CGFloat(i / 2) * height//scrollView.bounds.midY
            let item = GalleryItemView(frame: CGRect(x: x, y: y, width: width, height: height))
            item.backgroundColor = UIColor.white
            item.color = savedColors[i]
            item.paths = savedPaths[i]
            item.layer.borderWidth = 1.0
            item.layer.borderColor = UIColor(colorLiteralRed: 0.95, green: 0.95, blue: 0.95, alpha: 1).cgColor
            scrollView.addSubview(item)
        }
        var nRows = savedPaths.count
        if nRows % 2 == 1 {
            nRows += 1
        }
        nRows /= 2
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: CGFloat(nRows) * height/*scrollView.bounds.midY*/)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
