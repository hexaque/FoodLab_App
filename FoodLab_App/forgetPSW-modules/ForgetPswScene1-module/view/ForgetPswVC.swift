//
//  ForgetPswVC.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit

class ForgetPswVC: UIViewController {

    @IBOutlet weak var tbUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround() 
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

    @IBAction func buttonNext(_ sender: Any) {
        performSegue(withIdentifier: "forgetPsw1ToForgetPsw2", sender: nil)
    }
}
