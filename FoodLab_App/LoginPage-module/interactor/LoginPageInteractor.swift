//
//  LoginPageInteractor.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
import FirebaseAuth
class LoginPageInteractor:PresenterToInteractorLoginPageProtocol{
    var loginPagePresenter: InteractorToPresenterLoginPageProtocol?
    
    func loginI(eMail: String, psw: String) {
        
        let auth = Auth.auth()
        
        auth.signIn(withEmail: eMail, password: psw)
                
                auth.addStateDidChangeListener(){ (auth,user) in
                    if user != nil {
                        print("Login Success: " + (user?.email)! )
                        
                        self.loginPagePresenter?.isLogin(isUser: true)
                    }
                }
                
            }
    }
    
    

