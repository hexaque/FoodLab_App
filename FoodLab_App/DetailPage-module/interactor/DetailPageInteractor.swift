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
 
    
    
   func getCartInfoI() {
        let userInfo = Auth.auth().currentUser
        let userEmail = userInfo?.email

        if let email = userEmail{
            let param : Parameters = ["kullanici_adi":email]
            
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response { response in
                if let data = response.data {
                    
                    do {
                        let answer = try JSONDecoder().decode(FoodsCartResponse.self, from: data)
                        
                        if let answerArray = answer.sepet_yemekler {
                            self.detailPagePresenter?.cartInfoToPresenter(cartFood: answerArray)

                        }
                        
                    } catch  {
                        
                        print(error.localizedDescription)
                    }
                }
            }}
    }
    
    func deleteFromCartI(sepet_yemek_id: String, kullanici_adi: String) {
        if kullanici_adi ==  Auth.auth().currentUser?.email{
            let param : Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: param).response { response in
                if let data = response.data {
                    do{
                        let answer = try JSONSerialization.jsonObject(with: data)
                        print(answer)
                   
                    }catch{
                        print("sil")
                        print(error.localizedDescription)
                    }
                    
                    
                }}
            
            
        }
    }
    
    
    
    
    
    
    
    
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
                        print(cevap)
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
