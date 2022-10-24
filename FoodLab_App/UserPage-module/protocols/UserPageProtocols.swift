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
    func updateUserInfo(user_Name:String,user_Surname:String,user_Phone:String)
    func getFavFoodList()
    func deleteFoodFromFavList(yemek_adi:String)
}

protocol PresenterToInteractorUserPageProtocol{
    var userPagePresenter : InteractorToPresenterUserPageProtocol?{get set}
    func getUserInfoFromFireBaseI()
    func getUserImageFromFireBaseI()
    func updateUserInfoI(user_Name:String,user_Surname:String,user_Phone:String)
    func getFavFoodListI()
    func deleteFoodFromFavListI(yemek_adi:String)
}




protocol InteractorToPresenterUserPageProtocol{
    func dataToPresenter(user_Name:String,user_Surname:String,user_Phone:String)
    func imageToPresenter(user_Image:UIImage)
    func favListToPresenter(favFoodList:[Foods])
    func deleteFoodFromFavList(yemek_adi:String)
}

protocol PresenterToViewUserPageProtocol{
    func dataToView(user_Name:String,user_Surname:String,user_Phone:String)
    func imageToView(user_Image:UIImage)
    func favListToView(favFoodList:[Foods])
}

protocol PresenterToRouterUserPageProtocol{
    static func createModule(ref : UserPageVC)
    
}
