//
//  ForgetPswVC3.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit

class ForgetPswVC3: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var tbCode: UITextField!
    let verifyCode = "9900"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        labelError.isHidden = true
        self.hideKeyboardWhenTappedAround() 
    }
   
  
    
  

   
    @IBAction func buttonComplete(_ sender: Any) {
        if let code = tbCode.text{
           
                if code == verifyCode{
                    performSegue(withIdentifier: "forgetPsw3ToForgetPsw4", sender: nil)
                }else{
                    animationTF()
                    labelError.isHidden = false

                    
                
            }
           
        }
    }
    
    
    @IBAction func buttonCancel(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    func animationTF(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: tbCode.center.x - 10, y: tbCode.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: tbCode.center.x + 10, y: tbCode.center.y))

        tbCode.layer.add(animation, forKey: "position")
    }
    
}
