//
//  RegisterPageRouter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class RegisterPageRouter{
    static func createModule(ref: RegisterPageVC) {
        let presenter = RegisterPagePresenter()
        ref.registerPagePresenterObject=presenter
        ref.registerPagePresenterObject?.registerPageInteractor = RegisterPageInteractor()
        ref.registerPagePresenterObject?.registerPageView = ref
        ref.registerPagePresenterObject?.registerPageInteractor?.registerPagePresenter = presenter
  
        
        
        
        
    }
    
}
