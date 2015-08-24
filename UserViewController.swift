//
//  UserViewController.swift
//  tipr
//
//  Created by Andrew Wilkes on 8/23/15.
//  Copyright (c) 2015 Andrew Wilkes. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var lowSlider: UISlider!
    @IBOutlet weak var mediumSlider: UISlider!
    @IBOutlet weak var highSlider: UISlider!
    
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    
    var tipPercentages = [18, 20, 25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Loaded UserViewController")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var low = defaults.integerForKey("lowPercentage")
        if low != 0 {
            tipPercentages[0] = low
        }
        var medium = defaults.integerForKey("mediumPercentage")
        if medium != 0 {
            tipPercentages[1] = medium
        }
        var high = defaults.integerForKey("highPercentage")
        if high != 0 {
            tipPercentages[2] = high
        }
        lowSlider.value = Float(tipPercentages[0])
        lowSliderChanged(lowSlider)
        mediumSlider.value = Float(tipPercentages[1])
        mediumSliderChanged(mediumSlider)
        highSlider.value = Float(tipPercentages[2])
        highSliderChanged(highSlider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backButtonClicked(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(Int(lowSlider.value), forKey: "lowPercentage")
        defaults.setInteger(Int(mediumSlider.value), forKey: "mediumPercentage")
        defaults.setInteger(Int(highSlider.value), forKey: "highPercentage")

        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func lowSliderChanged(sender: UISlider) {
        let newValue = sender.value
        
        let toInt = round(newValue)
        
        lowLabel.text = "\(Int(toInt))%"
        
        sender.value = toInt
    }

    @IBAction func mediumSliderChanged(sender: UISlider) {
        let newValue = sender.value
        
        let toInt = round(newValue)
        
        mediumLabel.text = "\(Int(toInt))%"
        
        sender.value = toInt

    }
    
    @IBAction func highSliderChanged(sender: UISlider) {
        let newValue = sender.value
        
        let toInt = round(newValue)
        
        highLabel.text = "\(Int(toInt))%"
        
        sender.value = toInt
    }
}
