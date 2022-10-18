//
//  DetailPageInteractor.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
import FirebaseAuth
import Alamofire
class DetailPageInteractor:PresenterToInteractorDetailPageProtocol{
    func addToCartI(food:Foods,adet:String) {
        let userInfo = Auth.auth().currentUser
        let email = userInfo?.email
        if let yemek_adi = food.yemek_adi,let yemek_resim_adi = food.yemek_resim_adi, let yemek_fiyat = food.yemek_fiyat{
            
            if let intAdet = Int(adet), let intFiyat = Int(yemek_fiyat){

            let params:Parameters = ["yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":intFiyat ,"yemek_siparis_adet": intAdet,"kullanici_adi":email!]
            
            AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response { response in
                if let data = response.data {
                    do{
                        let cevap = try JSONSerialization.jsonObject(with: data)
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
            
            }} }
    
    var detailPagePresenter: InteractorToPresenterDetailPageProtocol?
    var adet = 1
    
    func minusI() {
        adet -= 1
        detailPagePresenter?.adetDataToPresenter(number: adet)
        
    }
    
    func plusI() {
        adet += 1
        detailPagePresenter?.adetDataToPresenter(number: adet)
    }
    
    func setTotalPriceI(price:Int) {
        let totalPrice = price * adet
        detailPagePresenter?.totalPriceDataToPresenter(number: totalPrice)
        
    }
    
    
}
