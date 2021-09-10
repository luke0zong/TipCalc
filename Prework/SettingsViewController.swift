//
//  SettingsViewController.swift
//  Prework
//
//  Created by Yaowei Zong on 9/9/21.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tip1: UITextField!
    @IBOutlet weak var tip2: UITextField!
    @IBOutlet weak var tip3: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        // Sets the title in the Navigation Bar
        self.title = "Settings"
    }
    
    @IBAction func tipChange(_ sender: Any) {
        defaults.set((Int(tip1.text!) ?? 15), forKey: "tip1")
        defaults.set((Int(tip2.text!) ?? 18), forKey: "tip2")
        defaults.set((Int(tip3.text!) ?? 20), forKey: "tip3")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("settings view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        defaults.synchronize()
        tip1.text = String(defaults.integer(forKey: "tip1"))
        tip2.text = String(defaults.integer(forKey: "tip2"))
        tip3.text = String(defaults.integer(forKey: "tip3"))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Force UserDefaults to save.
        defaults.synchronize()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
