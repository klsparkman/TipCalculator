//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Kelsey Sparkman on 4/6/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    
    // Mark: - Outlets
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var billBeforeTaxLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var splitPeopleLabel: UILabel!
    
    // Mark: - Properties
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountBeforeTaxTextField.becomeFirstResponder()
        amountBeforeTaxTextField.keyboardType = UIKeyboardType.decimalPad
    }
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100.0
        tipCalculator.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
        
    }
    
    func updateUI() {
        totalPerPersonLabel.text = String(format: "%.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleSlider.value)
        tipPerPersonLabel.text = String(format: "%.2f", tipCalculator.tipAmount / Double(numberOfPeople))
        billBeforeTaxLabel.addCornerRadius()
        tipPercentageLabel.addCornerRadius()
        splitPeopleLabel.addCornerRadius()
        tipPerPersonLabel.addCornerRadius()
        totalPerPersonLabel.addCornerRadius()
    }
    
    // Mark: - Actions
    @IBAction func tipSliderValueChanged(_ sender: Any) {
        tipPercentageLabel.text = "Tip: \(Int(tipPercentageSlider.value))"
            //String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        calculateBill()
    }
    @IBAction func numberOfPeopleSliderChanged(_ sender: Any) {
        splitPeopleLabel.text = "Split: \(Int(numberOfPeopleSlider.value))"
        calculateBill()
    }
    @IBAction func amountBeforeTextFieldChanged(_ sender: Any) {
        calculateBill()
    }
}//End of class
