//
//  Register2VC.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage


class Register2VC: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfSurname: UITextField!
    @IBOutlet weak var tfName: UITextField!
    var avatarImageName:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func imageTap(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker , animated:true)
        
    }
    
   
    func imagePickerController(_ picker : UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
           
        
    @IBAction func buttonYukle(_ sender: Any) {
        let store = Storage.storage()
        let storeRef = store.reference()
        let uuid = UUID().uuidString
        let mediaFolder = storeRef.child("images")
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let imageRefferance = mediaFolder.child("\(uuid).jpeg")
            imageRefferance.putData(data, metadata: nil){metadata, error in
                if error != nil{
                    print(error?.localizedDescription ?? "error")
                }else{
                    imageRefferance.downloadURL{url, error in
                        if error == nil{
                            
                            self.avatarImageName = uuid
                            
                            
                        }
                    }
                }
                
            }
        }
    }
    

    @IBAction func buttonNext(_ sender: Any) {
        
    
        
        let currentUser=Auth.auth().currentUser
        let user_uid = currentUser?.uid
       
        if let uN = tfName.text, let uS = tfSurname.text, let uP = tfPhone.text{
            let user = ["user_Uid":user_uid,"user_Name":uN,"user_Surname":uS,"user_Phone":uP,"user_ImageName":avatarImageName! ]
            Database.database().reference().child("users").child(user_uid!).setValue(user)
           
        }
       
    }
    
}

