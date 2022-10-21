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

    @IBOutlet weak var buttonYukle: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfSurname: UITextField!
    @IBOutlet weak var tfName: UITextField!
    var avatarImageName:String?
    var isUpload = false
    var isPhotoSelected = false
    override func viewDidLoad() {
        indicator.stopAnimating()
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
        
        if imageView.image == info[.originalImage] as? UIImage{
            isPhotoSelected = true
        }
            
        
        self.dismiss(animated: true)
    }
           
        
    @IBAction func buttonYukle(_ sender: Any) {
        if isPhotoSelected{
            indicator.startAnimating()
            self.view.isUserInteractionEnabled = false
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
                                
                                self.indicator.stopAnimating()
                                self.view.isUserInteractionEnabled = true
                                self.isUpload = true
                            }
                        }
                    }
                    
                }
            }
            
        }else{
            let alertContreller = UIAlertController(title: "Lütfen İlk Olarak Profil Fotoğrafı Seçin ", message:"", preferredStyle: .alert)
            self.present(alertContreller, animated: true)
            let okeyAction = UIAlertAction(title: "Tamam", style: .default)
            alertContreller.addAction(okeyAction)
        }
        
    
    }
    

    @IBAction func buttonNext(_ sender: Any) {
   
        if tfName.text!.count>2 && tfSurname.text!.count > 1 && isValidPhone(phone: tfPhone.text!){
            if isUpload{
                let currentUser=Auth.auth().currentUser
                let user_uid = currentUser?.uid
               
                if let uN = tfName.text, let uS = tfSurname.text, let uP = tfPhone.text{
                    let user = ["user_Uid":user_uid,"user_Name":uN,"user_Surname":uS,"user_Phone":uP,"user_ImageName":avatarImageName! ]
                    Database.database().reference().child("users").child(user_uid!).setValue(user)
                   
                }
            }
            else {
                let alertContreller = UIAlertController(title: "Lütfen Profil Fotoğrafı Yükleyin", message:"", preferredStyle: .alert)
                self.present(alertContreller, animated: true)
                let okeyAction = UIAlertAction(title: "Tamam", style: .default)
                alertContreller.addAction(okeyAction)
                
            }
            
            }
        
        
       
        
       else{
            let alertContreller = UIAlertController(title: "Bilgileri girin veya Atla butonuna basın.", message: "Lütfen bilgilerinizi eksiksiz girin. Güvenliğiniz açısından bilgilerinizi doğru girmeniz önemli.", preferredStyle: .alert)
            self.present(alertContreller, animated: true)
            let okeyAction = UIAlertAction(title: "Tamam", style: .default)
            alertContreller.addAction(okeyAction)
        }
        
      
       
    }
    func isValidPhone(phone: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phone)
        }
}

