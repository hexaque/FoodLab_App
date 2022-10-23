//
//  UserPageInteractor.swift
//  FoodLab_App
//
//  Created by Que on 23.10.2022.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import UIKit
class UserPageInteractor:PresenterToInteractorUserPageProtocol{
 
    
    var ref =  Database.database().reference().child("users")
    var userPagePresenter: InteractorToPresenterUserPageProtocol?
    var avatarImage:UIImage?
    var user_ImageName = "defaultImage"
    
   /*
   
    
    */
    func updateUserInfoI(user_Name:String,user_Surname:String,user_Phone:String){
        let uid = Auth.auth().currentUser?.uid
        
        let userUpdate = ["user_ImageName":self.user_ImageName, "user_Name": user_Name,"user_Phone": user_Phone,"user_Surname":user_Surname,"user_Uid":uid ]
            ref.child(uid!).setValue(userUpdate)
    }
    
    
    func getUserImageFromFireBaseI() {
        let reference = Storage.storage().reference(withPath: "images/\(user_ImageName).jpeg")
        print("+++++\(user_ImageName)")
              reference.getData(maxSize: (1 * 1024 * 1024)) { (data, error) in
                if let _error = error{
                   print(_error)
              } else {
                if let _data  = data {
                   let myImage:UIImage! = UIImage(data: _data)
                    
                     self.avatarImage = myImage
                    self.userPagePresenter?.imageToPresenter(user_Image: self.avatarImage!)
                
                }
             }
        }
    }
    func getUserInfoFromFireBaseI() {
        
        let query = ref.queryOrdered(byChild: "user_Uid").queryEqual(toValue:Auth.auth().currentUser?.uid)
        query.observe(.value, with: { snapshot in
            


            if let gelenVeri = snapshot.value as? [String:AnyObject] {
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary {
                        let user_Name = d["user_Name"] as? String ?? ""
                        let user_Surname = d["user_Surname"] as? String ?? ""
                        let user_Phone = d["user_Phone"] as? String ?? ""
                        self.user_ImageName = d["user_ImageName"] as? String ?? ""
                       
                 
                        print("---- \(self.user_ImageName)")
                        
                        
                      
                        
                        self.userPagePresenter?.dataToPresenter(user_Name: user_Name, user_Surname: user_Surname, user_Phone: user_Phone)
                    }}
                
            } })
    }
    

    
}

