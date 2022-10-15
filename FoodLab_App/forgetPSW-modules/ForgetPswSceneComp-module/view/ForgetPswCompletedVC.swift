//
//  ForgetPswCompletedVC.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit

class ForgetPswCompletedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
    }
    

    @IBAction func buttonToHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
