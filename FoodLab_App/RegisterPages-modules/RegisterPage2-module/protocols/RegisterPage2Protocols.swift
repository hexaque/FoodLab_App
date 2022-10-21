//
//  RegisterPage2Protocols.swift
//  FoodLab_App
//
//  Created by Que on 21.10.2022.
//

import Foundation
import UIKit
protocol ViewToPresenterRegisterPage2Protocol{
    var registerPage2Interactor : PresenterToInteractorRegisterPage2Protocol?{get set}
    var registerPage2View : PresenterToViewRegisterPage2Protocol?{get set}
    func registerInfo(userName:String,userSurname:String,userPhone:String)
    func savePhoto(image:UIImage)
}
protocol PresenterToInteractorRegisterPage2Protocol{
    var registerPage2Presenter : InteractorToPresenterRegisterPage2Protocol?{get set}
    func registerInfoI(userName:String,userSurname:String,userPhone:String)
    func savePhotoI(image:UIImage)
}

protocol InteractorToPresenterRegisterPage2Protocol{
    func dataToPresenter(isUpload:Bool)
}
protocol PresenterToViewRegisterPage2Protocol{
    func dataToView(isUpload:Bool)
    
}

protocol PresenterToRouterRegisterPage2Protocol{
    static func createModule(ref: RegisterPage2VC)
}
