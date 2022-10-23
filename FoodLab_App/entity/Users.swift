//
//  Users.swift
//  FoodLab_App
//
//  Created by Que on 20.10.2022.
//

import Foundation

class Users {
    
    var user_Uid:String?
    var user_Name:String?
    var user_Surname:String?
    var user_Phone:String?
    
    
 
    init(user_Uid: String, user_Name: String,user_Surname:String, user_Phone: String) {
        self.user_Uid = user_Uid
        self.user_Name = user_Name
        self.user_Surname = user_Surname
        self.user_Phone = user_Phone
    }
    
  
    
}
