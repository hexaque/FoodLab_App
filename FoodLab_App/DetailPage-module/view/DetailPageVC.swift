//
//  DetailPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit
import Kingfisher
class DetailPageVC: UIViewController {
    
    
    @IBOutlet weak var buttonFav: UIButton!
    
    
    @IBOutlet weak var imageFood: UIImageView!
    
    @IBOutlet weak var labelPrice: UILabel!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelNumber: UILabel!
    
    @IBOutlet weak var labelTotalPrice: UILabel!
    
    
    var food : Foods?
    var delegate : DetailPageToHomePage?
    var detailPagePresenterObject : ViewToPresenterDetailPageProtocol?
    let url = "http://kasimadalan.pe.hu/yemekler/resimler/"
    var fav = false
    var badgeForCart = 0
    override func viewDidLoad() {
        
        DetailPageRouter.createModule(ref: self)
        if let f = food{
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
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.sendBadgeCountToHomePage(badgeCount: badgeForCart)
        badgeForCart = 0
    }
   
    
    @IBAction func buttonBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func buttonAddCart(_ sender: Any) {
        badgeForCart += 1
        detailPagePresenterObject?.addToCart(food: food!, adet: labelNumber.text!)
       
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
    
    
    @IBAction func buttonFavAction(_ sender: Any) {
        if fav{
            fav=false
            let image = UIImage(named: "empty")//favEmptyIcon
            buttonFav.setImage(image, for: .normal)
        }else{
            fav=true
            let image = UIImage(named: "ful")//favoriteIcon
            buttonFav.setImage(image, for: .normal)
            
            
        }
    }
}

extension DetailPageVC :PresenterToViewDetailPageProtocol {
    func adetDataToView(number: Int) {
        labelNumber.text = String(number)
    }
    
    func totalPriceDataToView(number: Int) {
        labelTotalPrice.text = "\(String(number))₺"
    }
    
   
    
    
}
