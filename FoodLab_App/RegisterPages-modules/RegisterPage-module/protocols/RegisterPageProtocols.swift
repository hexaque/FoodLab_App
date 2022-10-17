//
//  RegisterPageProtocols.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
protocol ViewToPresenterRegisterPageProtocol{
    var registerPageInteractor : PresenterToInteractorRegisterPageProtocol?{get set}
    var registerPageView : PresenterToViewRegisterPageProtocol?{get set}
    func register(email:String,psw:String)
}
protocol PresenterToInteractorRegisterPageProtocol{
    var registerPagePresenter : InteractorToPresenterRegisterPageProtocol?{get set}
    func registerI(email:String,psw:String)
}

protocol InteractorToPresenterRegisterPageProtocol{
    func dataToPresenter(isCreate:Bool)
}
protocol PresenterToViewRegisterPageProtocol{
    func dataToView(isCreate:Bool)
    
}







protocol PresenterToRouterRegisterPageProtocol{
    static func createModule(ref: RegisterPageVC)
}
