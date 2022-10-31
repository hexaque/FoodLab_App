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
        
        auth.signIn(withEmail: eMail, password: psw) { (authResult, error) in
          if let error = error as? NSError {
              self.loginPagePresenter?.isLogin(isUser: false)
              self.loginPagePresenter?.sendErrorTypeToPresenter(error: error)
          } else {
            print("User signs in successfully")
              self.loginPagePresenter?.isLogin(isUser: true)
              
           // let userInfo = Auth.auth().currentUser
              
           // let email = userInfo?.email
             // print(email!)
           
          }
        }
        
        
        
        
  }
                
            }
    
    
    

