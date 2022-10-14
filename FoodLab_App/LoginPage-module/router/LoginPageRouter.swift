//
//  LoginPageRouter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class LoginPageRouter:PresenterToRouterLoginPageProtocol{
    static func createModule(ref: LoginPageVC) {
        ref.loginPagePresenterObject = LoginPagePresenter()
        //ref.LoginPagePresenterObject?.LoginPageInteractor = LoginPageInteractor()
    }
    
    
}
