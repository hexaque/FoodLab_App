//
//  ForgetPswVC.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit

class ForgetPswVC: UIViewController {

    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelError.isHidden = true
        self.hideKeyboardWhenTappedAround() 
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

    @IBAction func buttonNext(_ sender: Any) {
        if let mail = tfEmail.text{
            if isValidEmail(mail){
                labelError.isHidden = true
                performSegue(withIdentifier: "forgetPsw1ToForgetPsw2", sender: nil)
            }else{
                animationTF(textfield:tfEmail)
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
