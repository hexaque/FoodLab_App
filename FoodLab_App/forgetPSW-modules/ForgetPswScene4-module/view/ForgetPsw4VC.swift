//
//  ForgetPswScene4VC.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit

class ForgetPsw4VC: UIViewController {

   
    @IBOutlet weak var labelError: UILabel!
    
    @IBOutlet weak var tfNewPsw2: UITextField!
    @IBOutlet weak var tfNewPsw1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelError.isHidden = true
        self.hideKeyboardWhenTappedAround()
    }
    
    
    
    @IBAction func buttonNext(_ sender: Any) {
        if let pw1 = tfNewPsw1.text, let pw2 = tfNewPsw2.text{
            if pw1 == pw2 {
                performSegue(withIdentifier: "forgetPsw4ToForgetPswComp", sender: nil)
            }
            else{
                animationTF(tf: tfNewPsw2)
                animationTF(tf: tfNewPsw1)
                labelError.isHidden = false
            }
        }
    }
    
    func animationTF(tf : UITextField){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: tf.center.x - 10, y: tf.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: tf.center.x + 10, y: tf.center.y))

        tf.layer.add(animation, forKey: "position")
    }
    
 

}
