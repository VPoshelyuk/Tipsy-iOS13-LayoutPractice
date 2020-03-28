//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Slava Pashaliuk on 3/28/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var billInfo: Bill?
    
    @IBOutlet weak var perPerson: UILabel!
    @IBOutlet weak var explanationParagraph: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perPerson.text = billInfo?.pricePerPerson ?? "Error"
        if let safeBill = billInfo {
            explanationParagraph.text = "Split between \(safeBill.numOfPeople) people, with \(Int(safeBill.tipAmount * 100))% tip."
        }else{
            explanationParagraph.text = "Can't calculate. Please, try again!"
        }
    }
    
}
