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
    
    var pieceNames = [
        "Figure by Window",
        "Wine Glass and Postcard (Zurbaran)",
        "Stage #2 with Bed",
        "Berkeley #26",
        "Girl on the Beach",
        "Candy Counter",
        "Four Women",
        "Nude in Environment I",
        "Reclining Nude",
        "Italian Summer",
        "Red in Red",
        "Killyboffin",
        "Oakland Maquette",
        "Window",
        "Most of that Iceberg is Below the Water",
        "Homage to Boccioni #1",
        "Michelin X",
        "Woman Standing-Pink",
        "Lucifer",
        "Sinking Brick Plates",
        "Half a Dam",
        "Lux Lovely",
        "Untitled (Black on Gray)",
        "Lebron",
        "Untitled ()",
        "Timeless Clock",
        "Spoke",
        "Figure 8",
        "Transfiguration III",
        "Plum",
        "Homage to the Square: Diffused",
        "Rose",
        "Pink and White over Red",
        "Fall Euphony",
        "Untitled ()",
        "Burn and Glitter",
        "Pendulum",
        "1957 - J No. 1 (PH-142)",
        "Heteroclitus",
        "Number 64",
        "#15",
        "Largo-May",
        "Abstract Painting. 1966",
        "Ocean Park #60",
        "Hans Bricker in the Tropics",
        "The Tale",
        "The Coat II",
        "Black Ripe",
        "Votto",
        "At the Lake, Morning",
        "Sky Garden",
        "Horse",
        "The Beaubourg",
        "Zeltweg",
        "Untitled I",
        "Untitled Stack",
        "Hoarding My Frog Food",
        "Hommage to Philip Guston",
        "Untitled Standing Figure",
        "Handrian’s Court I",
        "Plumb Bob",
        "Inversion X",
        "Untitled ()",
        "1971-01-01",
        "Fall 1971",
        "Wall Painting No. IV",
        "Summer Image (For My Mother)",
        "Canton Lady",
        "Ill. Hegemann 30",
        "Serpentine",
        "Untitled ()",
        "No title (flagpole)",
        "No title (chapel)",
        "Erdnase",
        "No title (arch)",
        "Invocation",
        "Chain Gang",
        "Before, Again IV",
        "Dutch Landscape",
        "Factory Fire, August 8, 1985",
        "Barrier",
        "Street Light, February 7 1982",
        "Wishbone",
        "Fountain Figure #4",
        "Marina 2",
        "Wend",
        "Oboe",
        "Untitled V",
        "Dumka",
        "Glass Cube",
        "This Pair",
        "#13",
        "Step Wedge",
        "Quintana Roo",
        "Italian No. 3",
        "Telestich",
        "No title (hangman)",
        "Lever (#4)",
        "Pair of Steel Chairs",
        "Mouse Cup",
        "Exit",
        "Guy in the Dunes",
        "Set",
        "Red Ascending",
        "Theophrastus’ Garden",
        "Denial",
        "Houdini Challenged",
        "Patches",
        "Fulcrum",
        "Untitled #21",
        "1946",
        "Three Man Patrol",
        "Yosemite Falls (Homage to Watkins)",
        "Dumb Compass",
        "Untitled (Susan Rothenberg)",
        "Approach",
        "Dumb Luck",
        "Just to Mention a Few (after Bosch)",
        "Full Time",
        "Spear Form, Ember",
        "No title (flagpole, bronze)",
        "Study for Denial"
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
        if text != "" {
            for name in pieceNames {
                if(name.lowercased().commonPrefix(with: text) == text) {
                    curPieces.append(name)
                }
            }
        }
        for name in pieceNames {
            if(name.lowercased().commonPrefix(with: text) != text && name.lowercased().contains(text)) {
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
