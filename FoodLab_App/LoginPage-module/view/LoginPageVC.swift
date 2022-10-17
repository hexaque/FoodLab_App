//
//  LoginPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit
import FirebaseAuth
class LoginPageVC: UIViewController {
    var loginPagePresenterObject : ViewToPresenterLoginPageProtocol?
    

    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var tfUserName: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        LoginPageRouter.createModule(ref: self)
            

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let rootVC = navigationController?.viewControllers.first {
            navigationController?.viewControllers = [rootVC, self]}
    }
    

    @IBAction func buttonForgerPsw(_ sender: Any) {
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        
        let auth = Auth.auth()
        if let emailText = tfUserName.text,let pswText = tfPassword.text{
            loginPagePresenterObject?.login(eMail: emailText, psw: pswText)
            
            }
  
        
        //performSegue(withIdentifier: "toMainPage", sender: nil)
    }
    
}

extension LoginPageVC : PresenterToViewLoginPageProtocol{
    func isLoginV(isUser: Bool) {
        if isUser{
            self.performSegue(withIdentifier: "toMainPage", sender: nil)
        }else{
            print("başarısız giriş")
        }
        
    }
    
    
}
