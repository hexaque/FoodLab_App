//
//  ForgetPswVC2.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit

class ForgetPswVC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround() 
    }
    
    @IBAction func buttonSMS(_ sender: Any) {
        performSegue(withIdentifier: "forgetPsw2ToForgetPsw3", sender: nil)
    }
    
    @IBAction func buttonMail(_ sender: Any) {
        performSegue(withIdentifier: "forgetPsw2ToForgetPsw3", sender: nil)
    }
    
}
