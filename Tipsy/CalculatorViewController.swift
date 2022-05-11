//
//  ViewController.swift
//  Tipsy
//
//  Created by Sai Abhilash Gudavalli on 11/05/22.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var bill = Bill()
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        clearButtonSelection()
        sender.isSelected = true
        bill.updateTip(value: sender.currentTitle!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        bill.updateNumberOfPersons(value: Int(sender.value))
        splitNumberLabel.text = bill.getNumberOfPersons()
    }
    @IBAction func calculateTapped(_ sender: UIButton) {
        
        let billAmount = (billTextField.text! as NSString).floatValue
        bill.calucate(amount: billAmount)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalAmount = bill.getAmount()
            destinationVC.tipPercentage = bill.getTipPercentage()
            destinationVC.numberOfPeople = bill.getNumberOfPersons()
        }
    }
    
    func clearButtonSelection() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

