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

/*
 

 */
class RegisterPage2VC: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    var registerPage2PresenterObject : ViewToPresenterRegisterPage2Protocol?
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
        RegisterPage2Router.createModule(ref: self)
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
            registerPage2PresenterObject?.savePhoto(image: imageView.image!)
                                
                              
                            
                        
                    
                    
                
            
            
        }else{
            let alertContreller = UIAlertController(title: "Lütfen İlk Olarak Profil Fotoğrafı Seçin ", message:"", preferredStyle: .alert)
            self.present(alertContreller, animated: true)
            let okeyAction = UIAlertAction(title: "Tamam", style: .default)
            alertContreller.addAction(okeyAction)
        }
        
    
    }
    

    @IBAction func buttonNext(_ sender: Any) {
   
        if tfName.text!.count<2{
            animationTF(textfield: tfName)
        }
            
        else if tfSurname.text!.count < 1{
            animationTF(textfield: tfSurname)
            }
        else if !isValidPhone(phone: tfPhone.text!) {
                animationTF(textfield: tfPhone)
            }
        else{
            
            
            
            
            
            
            
            if isUpload{
                if let uN = tfName.text, let uS = tfSurname.text, let uP = tfPhone.text{
                    registerPage2PresenterObject?.registerInfo(userName: uN, userSurname: uS, userPhone: uP)
                    performSegue(withIdentifier: "register2ToComp", sender: nil)
                }
            }
            else {
                let alertContreller = UIAlertController(title: "Lütfen Profil Fotoğrafı Yükleyin", message:"", preferredStyle: .alert)
                self.present(alertContreller, animated: true)
                let okeyAction = UIAlertAction(title: "Tamam", style: .default)
                alertContreller.addAction(okeyAction)
                
            }
            
        }
        
        
       
        
   /*    else{
            let alertContreller = UIAlertController(title: "Bilgileri girin veya Atla butonuna basın.", message: "Lütfen bilgilerinizi eksiksiz girin. Güvenliğiniz açısından bilgilerinizi doğru girmeniz önemli.", preferredStyle: .alert)
            self.present(alertContreller, animated: true)
            let okeyAction = UIAlertAction(title: "Tamam", style: .default)
            alertContreller.addAction(okeyAction)
        }
        */
      
       
    }
    func isValidPhone(phone: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phone)
        }
    func animationTF(textfield:UITextField){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textfield.center.x - 10, y: textfield.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textfield.center.x + 10, y: textfield.center.y))

        textfield.layer.add(animation, forKey: "position")
    }
 
}

extension RegisterPage2VC:PresenterToViewRegisterPage2Protocol{
    func dataToView(isUpload: Bool) {
        self.isUpload = isUpload
        if isUpload{
            self.indicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
            
            
        }
    }
    
}
