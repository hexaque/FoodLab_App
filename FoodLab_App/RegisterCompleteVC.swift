//
//  RegisterCompleteVC.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit

class RegisterCompleteVC: UIViewController {
    
    
    @IBOutlet weak var animationView: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
    }
    


    @IBAction func buttonComplete(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
