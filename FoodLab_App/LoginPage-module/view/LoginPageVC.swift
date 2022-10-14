//
//  LoginPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit

class LoginPageVC: UIViewController {
    var loginPagePresenterObject : ViewToPresenterLoginPageProtocol?
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonForgerPsw(_ sender: Any) {
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
    }
    
}
