//
//  UserPageVC.swift
//  FoodLab_App
//
//  Created by Que on 18.10.2022.
//

import UIKit
import FirebaseAuth
class UserPageVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true 
        // Do any additional setup after loading the view.
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
