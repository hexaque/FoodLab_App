//
//  PaymentPageVC.swift
//  FoodLab_App
//
//  Created by Que on 21.10.2022.
//

import UIKit

class OrderDetailVC: UIViewController {

    @IBOutlet weak var labelTotalPrice2: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    @IBOutlet weak var labelCardInfo: UILabel!
    @IBOutlet weak var labelAdress: UILabel!
    var price:String?
    override func viewDidLoad() {
        
        labelTotalPrice.text = "\(price!) ₺"
        labelTotalPrice2.text = labelTotalPrice.text
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 
}
