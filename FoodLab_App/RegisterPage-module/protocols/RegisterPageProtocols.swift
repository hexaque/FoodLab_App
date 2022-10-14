//
//  RegisterPageProtocols.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
protocol ViewToPresenterRegisterPageProtocol{
    var registerPageInteractor : PresenterToInteractorRegisterPageProtocol?{get set}
    
}
protocol PresenterToInteractorRegisterPageProtocol{
    
}
protocol PresenterToRouterRegisterPageProtocol{
    static func createModule(ref: RegisterPageVC)
}
