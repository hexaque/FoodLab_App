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
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var TFName: UITextField!
    
    @IBOutlet weak var buttonDuzenle: UIButton!
    @IBOutlet weak var TFPhone: UITextField!
    @IBOutlet weak var TFSurname: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    var userPagePresenterObject : ViewToPresenterUserPageProtocol?
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var isEditinInfo = false
    var avatarImageName = ""
    
 
    
    override func viewDidLoad() {
        UserPageRouter.createModule(ref: self)
        
        
        indicator.stopAnimating()
        self.hideKeyboardWhenTappedAround()
        //indicator.stopAnimating()
        TFName.isEnabled = false
        TFSurname.isEnabled = false
        TFPhone.isEnabled = false
        super.viewDidLoad()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.clipsToBounds = true

        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 5.0
        userPagePresenterObject?.getUserInfoFromFireBase()
        
        //let query2 = ref.queryEqual(toValue: Auth.auth().currentUser!.uid, childKey: "user_Uid")
      
       
        
        navigationItem.hidesBackButton = true 
    
        
     
        
    }
  
    
    
    @IBAction func buttonDuzenle(_ sender: Any) {
        isEditinInfo = !isEditinInfo
        if isEditinInfo{
            let image = UIImage(named: "burger")
            buttonDuzenle.setImage(image, for: .normal)
            TFName.backgroundColor = UIColor.darkGray
            TFSurname.backgroundColor = UIColor.darkGray
            TFPhone.backgroundColor = UIColor.darkGray
            
            TFName.isEnabled = true
            TFSurname.isEnabled = true
            TFPhone.isEnabled = true
                
         
           
                /*let alertContreller = UIAlertController(title: "Lütfen Bilgileriniz Doğru Girin ", message:"", preferredStyle: .alert)
                self.present(alertContreller, animated: true)
                let okeyAction = UIAlertAction(title: "Tamam", style: .default)
                alertContreller.addAction(okeyAction)*/
            
           
            
        }else {
            //save et
            TFName.backgroundColor = UIColor.white
            TFSurname.backgroundColor = UIColor.white
            TFPhone.backgroundColor = UIColor.white
            let image = UIImage(named: "pizza")
            buttonDuzenle.setImage(image, for: .normal)
            TFName.isEnabled = false
            TFSurname.isEnabled = false
            TFSurname.isEnabled = false
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

extension UserPageVC : PresenterToViewUserPageProtocol{
  
    
    func imageToView(user_Image: UIImage) {
        
        self.avatarImageView.image = user_Image
        
    }
    
    func dataToView(user_Name: String, user_Surname: String, user_Phone: String) {
        self.TFName.text = user_Name
        self.TFSurname.text = user_Surname
        self.TFPhone.text = user_Phone
        userPagePresenterObject?.getUserImageFromFireBase()
      
    }
    
   
}
