//
//  ViewController.swift
//  Prework
//
//  Created by Yaowei Zong on 9/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        print("view did load")
        
        defaults.set(15, forKey: "tip1")
        defaults.set(18, forKey: "tip2")
        defaults.set(20, forKey: "tip3")
        self.billAmountTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        defaults.synchronize()
        // update control tip text
        for (index, tip) in getTips().enumerated() {
            tipControl.setTitle(String(tip) + "%", forSegmentAt: index)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        // foucus on bill amount
        self.billAmountTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    func getTips() ->[Int]{
        defaults.synchronize()
        return [
            defaults.integer(forKey: "tip1"),
            defaults.integer(forKey: "tip2"),
            defaults.integer(forKey: "tip3")]
    }
    
    
    @IBAction func calculateTip(_ sender: UITextField) {
        // get bill amount from user input
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = getTips()
        // calculate tip and total
        let percentage = Double(tipPercentages[tipControl.selectedSegmentIndex])
        let tip = bill * percentage / 100
        let total = tip + bill
        
        // update Tip label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // update Total label
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

