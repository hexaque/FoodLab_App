//
//  UserPageVC.swift
//  FoodLab_App
//
//  Created by Que on 18.10.2022.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import Firebase
import Kingfisher
class UserPageVC: UIViewController {
    var ref =  Database.database().reference().child("users")
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    
    var avatarImageName = ""
    
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelSurname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                        self.labelName.text = user_Name
                        self.labelSurname.text = user_Surname
                        self.labelPhone.text = user_Phone
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
