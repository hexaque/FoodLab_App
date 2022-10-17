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
    
    
    var registerPagePresenterObject : ViewToPresenterRegisterPageProtocol?
    
    

    override func viewDidLoad() {
        RegisterPageRouter.createModule(ref: self)
        self.hideKeyboardWhenTappedAround()
        super.viewDidLoad()
        

    
    }
    

    @IBAction func buttonRegister(_ sender: Any) {
        if let email = tfEmail.text , let psw = tfPassword.text{
            registerPagePresenterObject?.register(email: email, psw: psw)
            
        }
    }
    
 
}
extension RegisterPageVC : PresenterToViewRegisterPageProtocol{
    func dataToView(isCreate:Bool){
        if isCreate{
            print("ÜYE OLUŞTURULDU.")
            performSegue(withIdentifier: "toRegister2", sender: nil)
        }
        else{
            print("view Hata var")
        }
    }
}
