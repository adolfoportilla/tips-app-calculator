//
//  ViewController.swift
//  tips
//
//  Created by adolfo portilla on 12/4/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var onePerson: UILabel!
    
    @IBOutlet weak var twoPerson: UILabel!
    
    @IBOutlet weak var threePerson: UILabel!
    
    @IBOutlet weak var fourPerson: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        self.title = "Tip Calculator"
        
        onePerson.text = "$0.00"
        twoPerson.text = "$0.00"
        threePerson.text = "$0.00"
        fourPerson.text = "$0.00"
        
        billField.becomeFirstResponder()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipPercentage = defaults.doubleForKey("default_tip_percentage")
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        if (tipPercentage == 0.18) {
            tipControl.selectedSegmentIndex = 0
        }
        else if (tipPercentage == 0.20){
            tipControl.selectedSegmentIndex = 1
        }
        else if (tipPercentage == 0.25) {
            tipControl.selectedSegmentIndex = 2
        }
        else {
            tipControl.selectedSegmentIndex = 0
        }
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalLabel.text = String(format: "$%.2f", total)
        
        onePerson.text = String(format: "$%.2f", total/2)
        twoPerson.text = String(format: "$%.2f", total/3)
        threePerson.text = String(format: "$%.2f", total/4)
        fourPerson.text = String(format: "$%.2f", total/5)
    }
    
    override func viewWillDisappear(animated: Bool) { //This function serves to send the value of the segmented section to the next screen
        super.viewWillDisappear(animated)
        
        let percentages = [0.18, 0.20, 0.25]
        let percentageSelected = percentages[tipControl.selectedSegmentIndex]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(percentageSelected, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let percentages = [0.18, 0.20, 0.25]
        let tipPercentage = percentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        onePerson.text = String(format: "$%.2f", total/2)
        twoPerson.text = String(format: "$%.2f", total/3)
        threePerson.text = String(format: "$%.2f", total/4)
        fourPerson.text = String(format: "$%.2f", total/5)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

