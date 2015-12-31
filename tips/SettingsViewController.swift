//
//  SettingsViewController.swift
//  tips
//
//  Created by adolfo portilla on 12/4/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultPercentages: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {  //This function serves to reveice the value of the segmented section of the previos screen and update to the new value
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipPercentage = defaults.doubleForKey("default_tip_percentage")
        
        if (tipPercentage == 0.18) {
            defaultPercentages.selectedSegmentIndex = 0
        }
        else if (tipPercentage == 0.20){
            defaultPercentages.selectedSegmentIndex = 1
        }
        else if (tipPercentage == 0.25) {
            defaultPercentages.selectedSegmentIndex = 2
        }
        else {
            defaultPercentages.selectedSegmentIndex = 0
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        let percentages = [0.18, 0.20, 0.25]
        let percentageSelected = percentages[defaultPercentages.selectedSegmentIndex]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(percentageSelected, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
}
