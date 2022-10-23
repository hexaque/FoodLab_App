//
//  UserPageProtocols.swift
//  FoodLab_App
//
//  Created by Que on 23.10.2022.
//

import Foundation
import UIKit
protocol ViewToPresenterUserPageProtocol{
    var userPageInteractor : PresenterToInteractorUserPageProtocol?{get set}
    var userPageView : PresenterToViewUserPageProtocol?{get set}
    func getUserInfoFromFireBase()
    func getUserImageFromFireBase()

}

protocol PresenterToInteractorUserPageProtocol{
    var userPagePresenter : InteractorToPresenterUserPageProtocol?{get set}
    func getUserInfoFromFireBaseI()
    func getUserImageFromFireBaseI()
    
}




protocol InteractorToPresenterUserPageProtocol{
    func dataToPresenter(user_Name:String,user_Surname:String,user_Phone:String)
    func imageToPresenter(user_Image:UIImage)
}

protocol PresenterToViewUserPageProtocol{
    func dataToView(user_Name:String,user_Surname:String,user_Phone:String)
    func imageToView(user_Image:UIImage)
}

protocol PresenterToRouterUserPageProtocol{
    static func createModule(ref : UserPageVC)
    
}
