//
//  LoginPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit

class LoginPageVC: UIViewController {
    var loginPagePresenterObject : ViewToPresenterLoginPageProtocol?
    

    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var tfUserName: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
            

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let rootVC = navigationController?.viewControllers.first {
            navigationController?.viewControllers = [rootVC, self]}
    }
    

    @IBAction func buttonForgerPsw(_ sender: Any) {
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        performSegue(withIdentifier: "toMainPage", sender: nil)
    }
    
}
