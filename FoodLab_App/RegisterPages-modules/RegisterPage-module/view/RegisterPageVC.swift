//
//  RegisterPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit

class RegisterPageVC: UIViewController {
    

  
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tfEmail: UITextField!
    
  
    @IBOutlet weak var tfPassword: UITextField!
    
    
    @IBOutlet weak var labelError: UILabel!
    
    var registerPagePresenterObject : ViewToPresenterRegisterPageProtocol?
    
    

    override func viewDidLoad() {
        labelError.isHidden = true
        
        RegisterPageRouter.createModule(ref: self)
        self.hideKeyboardWhenTappedAround()
        super.viewDidLoad()
        indicator.stopAnimating()

    
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        sender.preventRepeatedPresses()
      
        if let email = tfEmail.text , let psw = tfPassword.text{
            if isValidEmail(email){
                if psw.count<6{
                    labelError.text = "Parola 6 haneden küçük olamaz"
                    labelError.isHidden = false
                    animationTF(textfield: tfPassword)
                }else{
                    self.view.isUserInteractionEnabled = false
                    indicator.startAnimating()
                    registerPagePresenterObject?.register(email: email, psw: psw)
                }
                
            }else{
                animationTF(textfield: tfEmail)
                labelError.text = "Lütfen geçerli bir mail giriniz."
                labelError.isHidden = false
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
extension RegisterPageVC : PresenterToViewRegisterPageProtocol{
    func dataToView(isCreate:Bool){
        if isCreate{
            self.view.isUserInteractionEnabled = true
            indicator.stopAnimating()
            labelError.isHidden = true
            print("ÜYE OLUŞTURULDU.")
            performSegue(withIdentifier: "toRegister2", sender: nil)
        }
        else{
            self.view.isUserInteractionEnabled = true
            indicator.stopAnimating()
            labelError.text = "Email kullanılıyor."
            labelError.isHidden = false
            animationTF(textfield: tfEmail)
        }
    }
}
