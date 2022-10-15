//
//  ForgetPswVC3.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit

class ForgetPswVC3: UIViewController {

    @IBOutlet weak var tbCode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonComplete(_ sender: Any) {
        performSegue(withIdentifier: "forgetPsw3ToForgetPswComp", sender: nil)
    }
    
    
    @IBAction func buttonCancel(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
