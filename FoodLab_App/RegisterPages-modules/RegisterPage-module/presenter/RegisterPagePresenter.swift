//
//  RegisterPagePresenter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class RegisterPagePresenter:InteractorToPresenterRegisterPageProtocol,ViewToPresenterRegisterPageProtocol{
    func dataToPresenter(isCreate: Bool) {
        registerPageView?.dataToView(isCreate: isCreate)
    }
    
    var registerPageInteractor: PresenterToInteractorRegisterPageProtocol?
    
    var registerPageView: PresenterToViewRegisterPageProtocol?
    
    func register(email: String, psw: String) {
        registerPageInteractor?.registerI(email: email, psw: psw)
    }
    
    
}
