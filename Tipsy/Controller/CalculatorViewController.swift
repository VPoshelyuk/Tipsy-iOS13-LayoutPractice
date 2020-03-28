//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipAmount: Float?
    var calcBill = CalculateBill()
    var splittedBill: Bill?
    
    @IBOutlet weak var billTotalInput: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    
    @IBAction func tipPercentage(_ sender: UIButton) {
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        twentyPctBtn.isSelected = false
        sender.isSelected = true
        tipAmount = Float(sender.currentTitle!.dropLast())!/100.0

        billTotalInput.endEditing(true)
    }
    @IBAction func chooseSplit(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        splittedBill = calcBill.split(amount: Float(billTotalInput?.text ?? "0.0")!, tipAmount: tipAmount ?? 0.0, numOfPeople: Int(splitLabel?.text ?? "1") ?? 1)
        self.performSegue(withIdentifier: "toResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.billInfo = splittedBill
        }
    }
}

