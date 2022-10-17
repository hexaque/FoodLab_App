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
            switch AuthErrorCode(rawValue: error.code) {
            case .operationNotAllowed:
                print("Indicates that email and password accounts are not enabled.")
                break
              // Error: Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.

            case .wrongPassword:
                print("The password is invalid or the user does not have a password.")
                break
              // Error:
            case .invalidEmail:
                print("Indicates the email address is malformed.")
                break
              // Error: Indicates the email address is malformed.
            default:
                print("Error: \(error.localizedDescription)")
            }
          } else {
            print("User signs in successfully")
              self.loginPagePresenter?.isLogin(isUser: true)
              
            let userInfo = Auth.auth().currentUser
              
            let email = userInfo?.email
              print(email!)
              //userInfo?.displayName = "berkeName"
             // print(userInfo?.displayName)
          }
        }
        
        
        
        
        
        
        
        /*auth.signIn(withEmail: eMail, password: psw,completion:{ result, error in
            
            if error == nil{
                print("Login Success:" )
                self.loginPagePresenter?.isLogin(isUser: true)
            }
            else{print("hata")}
        })
                
                
                */}
                
            }
    
    
    

