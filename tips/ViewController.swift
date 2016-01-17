//
//  ViewController.swift
//  tips
//
//  Created by Diandian Xiao on 1/13/16.
//  Copyright (c) 2016 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipGroup: UIView!
    
    @IBOutlet weak var tipTotalOne: UILabel!
    @IBOutlet weak var tipTotalTwo: UILabel!
    @IBOutlet weak var tipTotalThree: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipGroup.alpha = 0
        billField.becomeFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        if billField.text == "" {
            UIView.animateWithDuration(0.4, animations: {
                self.tipGroup.alpha = 0
                self.billField.frame = CGRectMake(48, 269, 242, 30)
            })
        }
        else {
            UIView.animateWithDuration(0.4, animations: {
                self.tipGroup.alpha = 1
                self.billField.frame = CGRectMake(48, 57, 242, 30)
            })
        }
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount *  tipPercentage
        
        tipLabel.text = String(format: "$%.2f", tip)
        tipTotalOne.text = String(format: "$%.2f", billAmount + tip)
        tipTotalTwo.text = String(format: "$%.2f", (billAmount + tip)/2)
        tipTotalThree.text = String(format: "$%.2f", (billAmount + tip)/3)

    }
}

