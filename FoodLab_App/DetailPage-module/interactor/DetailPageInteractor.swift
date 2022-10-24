//
//  DetailPageInteractor.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
import FirebaseAuth
import Alamofire
import Firebase
class DetailPageInteractor:PresenterToInteractorDetailPageProtocol{
    var detailPagePresenter: InteractorToPresenterDetailPageProtocol?
    var adet = 1
    
    
    func isFavedI(food:Foods){
        let uid = Auth.auth().currentUser?.uid
        let ref =  Database.database().reference().child("favorites").child(uid!)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in

            if snapshot.hasChild(food.yemek_id!){

                self.detailPagePresenter?.isFavedToPresenter(isFaved: true)

                }else{

                    self.detailPagePresenter?.isFavedToPresenter(isFaved: false)
                }


            })
        
        
    }
      
    func addFavI(food:Foods){
        let uid = Auth.auth().currentUser?.uid
        let ref =  Database.database().reference().child("favorites").child(uid!)
       
        
        let favFood = ["foodName":food.yemek_adi, "foodPrice": food.yemek_fiyat,"foodImageName": food.yemek_resim_adi,"foodID":food.yemek_id]
        ref.child(food.yemek_id!).setValue(favFood)
        
        
        
        
        
    }
    func deleteFavI(food:Foods){
        let uid = Auth.auth().currentUser?.uid
        let ref =  Database.database().reference().child("favorites").child(uid!)
        ref.child(food.yemek_id!).removeValue()
        
    }
    
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
