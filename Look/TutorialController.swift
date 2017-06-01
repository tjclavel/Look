//
//  TutorialController.swift
//  Look
//
//  Created by Thomas Clavelli on 6/1/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class TutorialController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let image = #imageLiteral(resourceName: "tutorial")
        let ratio = image.size.width / image.size.height
        let width = scrollView.bounds.width
        let height = width / ratio
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.image = image
        scrollView.addSubview(imageView)
        scrollView.contentSize = CGSize(width: width, height: height)
    }
    

    

}
