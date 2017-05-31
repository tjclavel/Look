//
//  DisplayController.swift
//  Look
//
//  Created by Thomas Clavelli on 4/27/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class DisplayController: UIViewController, UIGestureRecognizerDelegate {
    

    @IBOutlet weak var scrollView: UIScrollView!
    var savedPaths = [[[CGPoint]]]()
    var savedColors = [UIColor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let width = scrollView.bounds.midX
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
