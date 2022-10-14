//
//  RegisterPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit

class RegisterPageVC: UIViewController {
    

    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var tfUserName: UITextField!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = true

    
    }
    

    @IBAction func buttonRegister(_ sender: Any) {
    }
    
 
}
