//
//  LoginPageProtocols.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
protocol ViewToPresenterLoginPageProtocol{
    var loginPageInteractor : PresenterToInteractorLoginPageProtocol? {get set}
    var loginPageView : PresenterToViewLoginPageProtocol?{get set}
    func login(eMail:String,psw:String)
}
protocol PresenterToInteractorLoginPageProtocol{
    var loginPagePresenter : InteractorToPresenterLoginPageProtocol?{get set}
    func loginI(eMail:String,psw:String)
}

protocol InteractorToPresenterLoginPageProtocol{
    func isLogin(isUser:Bool)
    
}
protocol PresenterToViewLoginPageProtocol{
    func isLoginV(isUser:Bool)
}








protocol PresenterToRouterLoginPageProtocol{
    static func createModule(ref: LoginPageVC)
}
