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
    var errorCode:NSError?

    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    

    
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
    

    @IBAction func buttonForgerPsw(_ sender: UIButton) {
        sender.preventRepeatedPresses()
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func buttonLogin(_ sender: UIButton) {
        sender.preventRepeatedPresses()
        
        if let emailText = tfEmail.text,let pswText = tfPassword.text{
            if isValidEmail(emailText){
                loginPagePresenterObject?.login(eMail: emailText, psw: pswText)
            }else{
                animationTF(textfield: tfEmail)
            }
            
                
            
            }
        
       

    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func animationTF(textfield:UITextField){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textfield.center.x - 10, y: textfield.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textfield.center.x + 10, y: textfield.center.y))

        textfield.layer.add(animation, forKey: "position")
    }
    
}

extension LoginPageVC : PresenterToViewLoginPageProtocol{
    func sendErrorTypeToView(error: NSError) {
        errorCode=error
    }
    
    func isLoginV(isUser: Bool) {
        if isUser{
            self.performSegue(withIdentifier: "toMainPage", sender: nil)
        }else{
            print("başarısız")
            animationTF(textfield: tfEmail)
            animationTF(textfield: tfPassword)
         
        }
        
    }
    
    
}
