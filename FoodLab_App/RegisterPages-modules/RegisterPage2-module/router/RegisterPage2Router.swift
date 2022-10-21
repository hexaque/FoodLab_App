//
//  RegisterPage2Router.swift
//  FoodLab_App
//
//  Created by Que on 21.10.2022.
//

import Foundation

class RegisterPage2Router{
    static func createModule(ref: RegisterPage2VC) {
        let presenter = RegisterPage2Presenter()
        ref.registerPage2PresenterObject=presenter
        ref.registerPage2PresenterObject?.registerPage2Interactor = RegisterPage2Interactor()
        ref.registerPage2PresenterObject?.registerPage2View = ref
        ref.registerPage2PresenterObject?.registerPage2Interactor?.registerPage2Presenter = presenter
  
        
        
        
        
    }
    
}
