//
//  RegisterPageInteractor.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
import FirebaseAuth
class RegisterPageInteractor : PresenterToInteractorRegisterPageProtocol{
    var registerPagePresenter: InteractorToPresenterRegisterPageProtocol?
    
    func registerI(email: String, psw: String) {
        let auth = Auth.auth()
        auth.createUser(withEmail: email, password: psw){(authresult, error) in
            if error == nil{
          
                
                self.registerPagePresenter?.dataToPresenter(isCreate: true)
                
            }
            else{
                self.registerPagePresenter?.dataToPresenter(isCreate: false)
            }
        }
        
        
    }
    
    
}
