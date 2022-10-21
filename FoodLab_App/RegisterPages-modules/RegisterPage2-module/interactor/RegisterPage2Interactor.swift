//
//  RegisterPage2Interactor.swift
//  FoodLab_App
//
//  Created by Que on 21.10.2022.
//

import Foundation
import Firebase
import FirebaseAuth
import UIKit
import FirebaseStorage
class RegisterPage2Interactor : PresenterToInteractorRegisterPage2Protocol{
    var registerPage2Presenter: InteractorToPresenterRegisterPage2Protocol?
    
    var avatarImageName:String?
    func savePhotoI(image: UIImage) {
        let store = Storage.storage()
        let storeRef = store.reference()
        let uuid = UUID().uuidString
        let mediaFolder = storeRef.child("images")
        if let data = image.jpegData(compressionQuality: 0.5){
            let imageRefferance = mediaFolder.child("\(uuid).jpeg")
            imageRefferance.putData(data, metadata: nil){metadata, error in
                if error != nil{
                    print(error?.localizedDescription ?? "error")
                }else{
                    imageRefferance.downloadURL{url, error in
                        if error == nil{
                            
                            self.avatarImageName = uuid
                            self.registerPage2Presenter?.dataToPresenter(isUpload: true)
                         
                        }
                    }
                }
                
            }
        }
    }
    
    func registerInfoI(userName: String, userSurname: String, userPhone: String) {
        let currentUser=Auth.auth().currentUser
        let user_uid = currentUser?.uid
        let user = ["user_Uid":user_uid,"user_Name":userName,"user_Surname":userSurname,"user_Phone":userPhone,"user_ImageName":avatarImageName]
        Database.database().reference().child("users").child(user_uid!).setValue(user)
    }
    
    
}
