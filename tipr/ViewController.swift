//
//  ViewController.swift
//  tipr
//
//  Created by Andrew Wilkes on 8/23/15.
//  Copyright (c) 2015 Andrew Wilkes. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var billField:
        UITextField!
    @IBOutlet weak var tipLabel:
        UILabel!
    @IBOutlet weak var totalLabel:
        UILabel!
    @IBOutlet weak var tipControl:
        UISegmentedControl!
    
    var tipPercentages = [18, 20, 25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var percentage = Double(tipPercentages[tipControl.selectedSegmentIndex]) / 100.0
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * percentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onSwipe(sender: AnyObject) {
        performSegueWithIdentifier("settingsSegue", sender: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadDefaults()
        onEditingChanged(tipControl)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func loadDefaults() {
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
        
        tipControl.setTitle("\(tipPercentages[0])%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(tipPercentages[1])%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(tipPercentages[2])%", forSegmentAtIndex: 2)
    }
}

