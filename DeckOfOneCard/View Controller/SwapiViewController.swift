//
//  SwapiViewController.swift
//  DeckOfOneCard
//
//  Created by Dustin Koch on 5/13/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

class SwapiViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var identifierTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IB Actions
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let identiferAsString = identifierTextField.text,
            identifierTextField.text != "" else { return }
        guard let identifier = Int(identiferAsString) else { return }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        PersonController.shared.fetchPersonWith(identifier: identifier) { (person) in
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.nameLabel.text = person?.name
                self.yearLabel.text = person?.birthYear
                self.hairColorLabel.text = person?.hairColor
                self.eyeColorLabel.text = person?.eyeColor
            }
        }
    }
}//END OF CLASS
