//
//  DetailPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit
import Kingfisher
import FirebaseAuth
class DetailPageVC: UIViewController {
    
    
    @IBOutlet weak var buttonFav: UIButton!
    
    
    @IBOutlet weak var imageFood: UIImageView!
    
    @IBOutlet weak var labelPrice: UILabel!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelNumber: UILabel!
    
    @IBOutlet weak var labelTotalPrice: UILabel!
    
    var cartFoods: [FoodsCart] = []
    var food : Foods?
    var delegate : DetailPageToHomePage?
    var detailPagePresenterObject : ViewToPresenterDetailPageProtocol?
    let url = "http://kasimadalan.pe.hu/yemekler/resimler/"
    var isFaved:Bool?
    var badgeForCart = 0
    var userEmail : String?
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround()
        let userInfo = Auth.auth().currentUser
         userEmail = userInfo?.email
        DetailPageRouter.createModule(ref: self)
        
        if let f = food{
            detailPagePresenterObject?.isFaved(food: f)
            if let url = URL(string: "\(url)\(f.yemek_resim_adi!)"){
                DispatchQueue.main.async {
                    self.imageFood.kf.setImage(with : url)
                }
                
            }
            labelPrice.text = "\(f.yemek_fiyat!)₺"
            labelName.text = f.yemek_adi
            labelTotalPrice.text = "\(f.yemek_fiyat!)₺"
            
        }
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailPagePresenterObject?.getCartInfo()
        
         
    }
   
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    
    
    @IBAction func buttonAddCart(_ sender: Any) {
       
        let alertContreller = UIAlertController(title: "Başarılı", message: "Sepete Eklendi", preferredStyle: .alert)
        
        self.present(alertContreller, animated: true)
        let tamamAction = UIAlertAction(title: "Tamam", style: .cancel){
            action in
            self.navigationController?.popViewController(animated: true)
        }
        alertContreller.addAction(tamamAction)
        
        var toplamAdetString = labelNumber.text!
        
        if let existCart = cartFoods.first(where: {$0.yemek_adi! == food?.yemek_adi!}){
            self.detailPagePresenterObject?.deleteFromCart(sepet_yemek_id: existCart.sepet_yemek_id!, kullanici_adi: userEmail!)
           
            let toplamAdet = Int(existCart.yemek_siparis_adet!)! + Int(labelNumber.text!)!
            toplamAdetString = String(toplamAdet)
            badgeForCart = cartFoods.count
        }else{
            badgeForCart = cartFoods.count+1
            
        }
        
        delegate?.sendBadgeCountToHomePage(badgeCount: badgeForCart)
        detailPagePresenterObject?.addToCart(food: food!, adet: toplamAdetString)

       
    }
    

    
    
    @IBAction func buttonPlus(_ sender: Any) {
        if let a = labelNumber.text{
            if let a = Int(a){
                if a < 10 {
                    detailPagePresenterObject?.plus()
                    if let price = food?.yemek_fiyat{
                        detailPagePresenterObject?.setTotalPrice(price: Int(price)!)
                    }
                    
                }
                
            }
        }
        
        
    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        if let a = labelNumber.text{
            if let a = Int(a){
                if a > 1 {
                    detailPagePresenterObject?.minus()
                    if let price = food?.yemek_fiyat{
                        detailPagePresenterObject?.setTotalPrice(price: Int(price)!)
                    }
                }
                
            }}
    }
    
    
    @IBAction func buttonFavAction(_ sender: UIButton) {
        sender.preventRepeatedPresses()
        if let isFavedU = isFaved{
            if isFavedU{
                
                detailPagePresenterObject?.deleteFav(food: self.food!)
                detailPagePresenterObject?.isFaved(food: self.food!)
            }else{
                detailPagePresenterObject?.addFav(food: self.food!)
                detailPagePresenterObject?.isFaved(food: self.food!)
                
                
            }
        }
        }
      
}

extension DetailPageVC :PresenterToViewDetailPageProtocol {
    func isFavedToView(isFaved: Bool) {
        self.isFaved = isFaved
        
        if isFaved{
            let image = UIImage(systemName: "heart.fill")//favoriteIcon
            buttonFav.setImage(image, for: .normal)
        }else{
            let image = UIImage(systemName: "heart")//favEmptyIcon
            buttonFav.setImage(image, for: .normal)
            detailPagePresenterObject?.deleteFav(food: self.food!)
           
        }
    }
    
    func cartInfoToView(cartFood: [FoodsCart]) {
        self.cartFoods = cartFood
    }
    
    func adetDataToView(number: Int) {
        labelNumber.text = String(number)
    }
    
    func totalPriceDataToView(number: Int) {
        labelTotalPrice.text = "\(String(number))₺"
    }
    
   
    
    
}
