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
    @IBOutlet weak var tipTotalPerPersonLabel: UILabel!
    @IBOutlet weak var totalPricePerPersonLabel: UILabel!
    @IBOutlet weak var billBeforeTaxLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var splitPeopleLabel: UILabel!
    
    // Mark: - Properties
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountBeforeTaxTextField.becomeFirstResponder()
        amountBeforeTaxTextField.keyboardType = UIKeyboardType.numberPad
    
    }
    
    func calculateTip() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100
        tipCalculator.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
        
    }
    
    func updateUI() {
        totalPricePerPersonLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleSlider.value)
        tipTotalPerPersonLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
    }
    
    // Mark: - Actions
    @IBAction func tipSliderValueChanged(_ sender: Any) {
        tipPercentageLabel.text = String(format: "Tip: %0.1d%%", Int(tipPercentageSlider.value))
        calculateTip()
    }
    @IBAction func numberOfPeopleSliderChanged(_ sender: Any) {
        splitPeopleLabel.text = "Split: \(Int(numberOfPeopleSlider.value))"
        calculateTip()
    }
    @IBAction func amountBeforeTextFieldChanged(_ sender: Any) {
        calculateTip()
    }
}//End of class
