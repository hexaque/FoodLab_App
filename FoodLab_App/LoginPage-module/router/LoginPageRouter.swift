//
//  LoginPageRouter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class LoginPageRouter:PresenterToRouterLoginPageProtocol{
    static func createModule(ref: LoginPageVC) {
        
        let presenter = LoginPagePresenter()
        ref.loginPagePresenterObject = presenter
        ref.loginPagePresenterObject?.loginPageInteractor = LoginPageInteractor()
        ref.loginPagePresenterObject?.loginPageView = ref
        ref.loginPagePresenterObject?.loginPageInteractor?.loginPagePresenter = presenter
        

    }
    
    
}
