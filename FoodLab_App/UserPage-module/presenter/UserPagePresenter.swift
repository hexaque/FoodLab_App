//
//  UserPagePresenter.swift
//  FoodLab_App
//
//  Created by Que on 23.10.2022.
//

import Foundation
import UIKit
class UserPagePresenter:ViewToPresenterUserPageProtocol, InteractorToPresenterUserPageProtocol{
    var userPageInteractor: PresenterToInteractorUserPageProtocol?
    
    var userPageView: PresenterToViewUserPageProtocol?
    
    func updateUserInfo(user_Name: String, user_Surname: String, user_Phone: String) {
        userPageInteractor?.updateUserInfoI(user_Name: user_Name, user_Surname: user_Surname, user_Phone: user_Phone)
    }
    
    
    func getUserImageFromFireBase() {
        userPageInteractor?.getUserImageFromFireBaseI()
    }
    
  
    
    func imageToPresenter(user_Image: UIImage) {
        userPageView?.imageToView(user_Image: user_Image)
    }
    
 
    func dataToPresenter(user_Name:String,user_Surname:String,user_Phone:String){
        userPageView?.dataToView(user_Name: user_Name, user_Surname: user_Surname, user_Phone: user_Phone)
    }
    func getUserInfoFromFireBase() {
        userPageInteractor?.getUserInfoFromFireBaseI()
    }
    
   
    
    
}
