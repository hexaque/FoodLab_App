//
//  LoginPageProtocols.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
protocol ViewToPresenterLoginPageProtocol{
    var loginPageInteractor : PresenterToInteractorLoginPageProtocol? {get set}
}
protocol PresenterToInteractorLoginPageProtocol{
    
}


protocol PresenterToRouterLoginPageProtocol{
    static func createModule(ref: LoginPageVC)
}
