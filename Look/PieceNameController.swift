//
//  PieceNameController.swift
//  Look
//
//  Created by Thomas Clavelli on 4/26/17.
//  Copyright © 2017 Thomas Clavelli. All rights reserved.
//

import UIKit

class PieceNameController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var returnButton: UIButton!
    var savedPaths = [[[CGPoint]]]()
    var savedColors = [UIColor]()
    
    let pieceNames = [
        "import UIKit",
        "class PieceName Controller",
        "UIViewController",
        "UITextFieldDelegate",
        "@IBOutlet weak",
        "textfield",
        "label: UILabel!",
        "let pieceNames",
        "override"
    ]
    
    var curPieces = [String]()
    var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnButton.isEnabled = false
        backgroundColor = returnButton.backgroundColor
        returnButton.backgroundColor = UIColor.gray
        textfield.delegate = self
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

        override func viewDidLayoutSubviews() {
            let border = CALayer()
            let width = CGFloat(2)
            border.borderColor = UIColor.black.cgColor
            border.frame = CGRect(x: 0, y: textfield.frame.size.height - width, width:  textfield.frame.size.width, height: textfield.frame.size.height)
            border.borderWidth = width
            textfield.layer.addSublayer(border)
            textfield.layer.masksToBounds = true
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(curPieces.contains(textfield.text!)) {
            returnButton.isEnabled = true
            returnButton.backgroundColor = backgroundColor
        }
    }

    @IBAction func editingDidChange(_ sender: UITextField) {
        if(!curPieces.contains(textfield.text!) && returnButton.isEnabled) {
            returnButton.isEnabled = false
            returnButton.backgroundColor = UIColor.gray
        }
        let text = textfield.text!.lowercased()
        curPieces.removeAll()
        for name in pieceNames {
            if(name.lowercased().contains(text)) {
                curPieces.append(name)
            }
        }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curPieces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = curPieces[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textfield.text = curPieces[indexPath.row]
        _ = textFieldShouldReturn(textfield)
        curPieces.removeAll()
        table.reloadData()
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let activityStart = self.storyboard?.instantiateViewController(withIdentifier: "ActivityStart") as! ActivityController
        activityStart.savedPaths = savedPaths
        activityStart.savedColors = savedColors
        self.present(activityStart, animated: true, completion: nil)
    }
}
