//
//  Register2VC.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit
import FirebaseAuth
import Firebase

class Register2VC: UIViewController {

    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfSurname: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
    }
    
    
    
   

           
        
    

    @IBAction func buttonNext(_ sender: Any) {
       
        
        
        let currentUser=Auth.auth().currentUser
        let user_uid = currentUser?.uid
        if let uN = tfName.text, let uS = tfSurname.text, let uP = tfPhone.text{
            let user = ["user_Uid":user_uid,"user_Name":uN,"user_Surname":uS,"user_Phone":uP ]
            Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).setValue(user)
        
        }
       
    }
    
}
