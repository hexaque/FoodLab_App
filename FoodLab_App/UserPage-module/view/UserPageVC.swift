//
//  UserPageVC.swift
//  FoodLab_App
//
//  Created by Que on 18.10.2022.
//
// DÜZENLENECEK.
import UIKit
import FirebaseAuth
import FirebaseStorage
import Firebase
import Kingfisher
class UserPageVC: UIViewController {
    var ref =  Database.database().reference().child("users")
    
    @IBOutlet weak var TFName: UITextField!
    
    @IBOutlet weak var buttonDuzenle: UIButton!
    @IBOutlet weak var TFPhone: UITextField!
    @IBOutlet weak var TFSurname: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var isEditinInfo = false
    var avatarImageName = ""
    
 
    
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround()
        indicator.stopAnimating()
        TFName.isEnabled = false
        TFSurname.isUserInteractionEnabled = false
        TFPhone.isUserInteractionEnabled = false
        super.viewDidLoad()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.clipsToBounds = true

        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 5.0
        getUserInfoFromFireBase()
        //let query2 = ref.queryEqual(toValue: Auth.auth().currentUser!.uid, childKey: "user_Uid")
      
        
        
        navigationItem.hidesBackButton = true 
    
        
     
        
    }
  
    
    func getUserInfoFromFireBase(){

        let query = ref.queryOrdered(byChild: "user_Uid").queryEqual(toValue:Auth.auth().currentUser?.uid)
        query.observe(.value, with: { snapshot in
            


            if let gelenVeri = snapshot.value as? [String:AnyObject] {
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary {
                        let user_Name = d["user_Name"] as? String ?? ""
                        let user_Surname = d["user_Surname"] as? String ?? ""
                        let user_Phone = d["user_Phone"] as? String ?? ""
                        let user_ImageName = d["user_ImageName"] as? String ?? ""
                        self.TFName.text = user_Name
                        self.TFSurname.text = user_Surname
                        self.TFPhone.text = user_Phone
                        self.avatarImageName = user_ImageName
                        
                        print("-----------------------   \(self.avatarImageName)")
                        let reference = Storage.storage().reference(withPath: "images/\(self.avatarImageName).jpeg")
                              reference.getData(maxSize: (1 * 1024 * 1024)) { (data, error) in
                                if let _error = error{
                                   print(_error)
                              } else {
                                if let _data  = data {
                                   let myImage:UIImage! = UIImage(data: _data)
                                     self.avatarImageView.image = myImage
                                
                                }
                             }
                        }
                    
                    }}}


            })
       
    
        }
    
        
    
   
    
    
    @IBAction func buttonDuzenle(_ sender: Any) {
        if isEditinInfo{
            if TFName.text!.count > 3 && TFName.text!.count < 10 && TFSurname.text!.count > 1 && TFSurname.text!.count < 10 && TFPhone.text!.count>10 {
                buttonDuzenle.setTitle("Bilgileri Düzenle", for: .normal)
                isEditing = false
                TFName.isEnabled = false
                TFSurname.isEnabled = false
                TFSurname.isEnabled = false
            }else{
                let alertContreller = UIAlertController(title: "Lütfen Bilgileriniz Doğru Girin ", message:"", preferredStyle: .alert)
                self.present(alertContreller, animated: true)
                let okeyAction = UIAlertAction(title: "Tamam", style: .default)
                alertContreller.addAction(okeyAction)
            }
           
            //save et
        }else {
            buttonDuzenle.setTitle("Bilgileri Onayla", for: .normal)
            TFName.isEnabled = true
            TFSurname.isEnabled = true
            TFSurname.isEnabled = true
        }
    }
    
    
    
    
    
    
    
    @IBAction func buttonLogout(_ sender: Any) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        let controller = storyboard?.instantiateViewController(withIdentifier: "welcomePage") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true, completion: nil)
   
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
    }
    
 

}
