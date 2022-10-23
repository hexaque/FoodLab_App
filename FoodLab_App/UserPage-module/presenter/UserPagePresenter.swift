//
//  UserPagePresenter.swift
//  FoodLab_App
//
//  Created by Que on 23.10.2022.
//

import Foundation
import UIKit
class UserPagePresenter:ViewToPresenterUserPageProtocol, InteractorToPresenterUserPageProtocol{
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
    
    var userPageInteractor: PresenterToInteractorUserPageProtocol?
    
    var userPageView: PresenterToViewUserPageProtocol?
    
    
}
