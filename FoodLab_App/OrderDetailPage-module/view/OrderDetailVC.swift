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
    var delegate:OrderDetailToCartPage?
    override func viewDidLoad() {
        
        labelTotalPrice.text = "\(price!) ₺"
        labelTotalPrice2.text = labelTotalPrice.text
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonNext(_ sender: Any) {
        let alert = UIAlertController(title: "Ödeme Alınıyor", message:"Ödeme alınıyor Lütfen bekleyiniz", preferredStyle: .alert)
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            
            self.performSegue(withIdentifier: "toOrderTrackingPage", sender: nil)
            alert.dismiss(animated: true)
            self.delegate?.deleteCart()
        
            
        }
        
    }
    
    
}
