//
//  ForgetPswVC2.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit

class ForgetPswVC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround() 
    }
    
    @IBAction func buttonSMS(_ sender: Any) {
        let alertContreller = UIAlertController(title: "Şifre sıfırlama", message: "Şifre sıfırlama mesajı sistemde (var ise) kayıtlı telefonunuza gönderildi.", preferredStyle: .alert)
        
        self.present(alertContreller, animated: true)
        let tamamAction = UIAlertAction(title: "Tamam", style: .default){
            action in
            self.navigationController?.popToRootViewController(animated: true)
        }

        alertContreller.addAction(tamamAction)
        
      
    }
    
    @IBAction func buttonMail(_ sender: Any) {
        let alertContreller = UIAlertController(title: "Şifre sıfırlama", message: "Şifre sıfırlama maili sistemde (var ise) kayıtlı mail adresinize gönderildi.", preferredStyle: .alert)
        
        self.present(alertContreller, animated: true)
        let tamamAction = UIAlertAction(title: "Tamam", style: .default){
            action in
            self.navigationController?.popToRootViewController(animated: true)
        }

        alertContreller.addAction(tamamAction)
    }
    
}
