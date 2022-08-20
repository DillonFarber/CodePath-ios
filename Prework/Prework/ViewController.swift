//
//  ViewController.swift
//  Prework
//
//  Created by Dillon Farber on 8/18/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var currencySymbol = "$"
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var currencyPickerView: UIPickerView!
    let currencies = Locale.isoCurrencyCodes
   
    var symbol: String = "$"
    
    override func viewDidLoad() {
        
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
        tipAmountLabel.isHidden = true
        totalLabel.isHidden = true
        tipControl.selectedSegmentIndex = 0
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let locale = NSLocale(localeIdentifier: currencies[row])
        symbol = locale.displayName(forKey: NSLocale.Key.currencySymbol, value: currencies[row])!
        tipAmountLabel.isHidden = false
        totalLabel.isHidden = false
    }
    
 
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0.00
        
        // Get Total tip
        let tipPercentage = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = Double(bill + tip)
        
        
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "\(symbol)%.2f", tip)
        // update total amount
        totalLabel.text = String(format: "\(symbol)%.2f", total)
    }
    
}




