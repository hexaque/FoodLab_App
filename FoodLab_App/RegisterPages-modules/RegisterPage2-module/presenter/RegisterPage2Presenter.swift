//
//  RegisterPage2Presenter.swift
//  FoodLab_App
//
//  Created by Que on 21.10.2022.
//

import Foundation
import UIKit
class RegisterPage2Presenter:ViewToPresenterRegisterPage2Protocol,InteractorToPresenterRegisterPage2Protocol{
   
    var registerPage2View: PresenterToViewRegisterPage2Protocol?
    func dataToPresenter(isUpload: Bool) {
        
        registerPage2View?.dataToView(isUpload: isUpload)
    }
    
    
    
    
    func savePhoto(image: UIImage) {
        registerPage2Interactor?.savePhotoI(image: image)
    }
    
    func registerInfo(userName: String, userSurname: String, userPhone: String) {
        registerPage2Interactor?.registerInfoI(userName: userName, userSurname: userSurname, userPhone: userPhone)
    }
    
    var registerPage2Interactor: PresenterToInteractorRegisterPage2Protocol?
    
   
    
   
    
}
