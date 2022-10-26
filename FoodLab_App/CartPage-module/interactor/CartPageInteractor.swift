//
//  CartPageInteractor.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
import FirebaseAuth
import Alamofire
class CartPageInteractor:PresenterToInteractorCartPageProtocol{
    
    var cartPagePresenter: InteractorToPresenterCartPageProtocol?
    
    
    
    func changeCartFoodCountI(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,sepet_yemek_id:String ,yeniAdet:String){
        let userInfo = Auth.auth().currentUser
        let email = userInfo?.email
        
        //deleteCartFoodI(sepet_yemek_id:sepet_yemek_id , kullanici_adi: email!)
        let param : Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":email!]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: param).response { response in
            if let data = response.data {
                do{
                   let answer = try JSONSerialization.jsonObject(with: data)
                    print(answer)
                    
                }catch{
                    print(error.localizedDescription)
                }
                
                
            }}
        
        
        
        
        
        
        
        
        
        
        //------
        addToCartI(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yeniAdet)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            self.getCartFoodI()
        }
       
        
    }
    
    func addToCartI(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String) {
        let userInfo = Auth.auth().currentUser
        let email = userInfo?.email

            if let intAdet = Int(yemek_siparis_adet), let intFiyat = Int(yemek_fiyat){

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
            
            } }
    
    
    
    
    
    func getCartFoodI() {
        let userEmail = Auth.auth().currentUser?.email
        var totalPrice = 0
        var foodTotalPrice = 0
        let emptyAnswerArray : [FoodsCart] = []
        if let email = userEmail{
            
            
            let param : Parameters = ["kullanici_adi":email]
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response { response in
                if let data = response.data {
                    
                    do {
                        let answer = try JSONDecoder().decode(FoodsCartResponse.self, from: data)
                        
                        if var answerArray = answer.sepet_yemekler {
                            for food in answerArray{
                                foodTotalPrice = Int(food.yemek_siparis_adet!)! * Int(food.yemek_fiyat!)!
                                totalPrice += foodTotalPrice
                            }
                            answerArray.sort(by: { ($0.yemek_adi!) < ($1.yemek_adi!) })
                            
                                self.cartPagePresenter?.sendDataToPresenter(foodsCart: answerArray, totalPrice: totalPrice)
                            
                            
                        }
                        
                    } catch  {
                        self.cartPagePresenter?.sendDataToPresenter(foodsCart: emptyAnswerArray, totalPrice: 0)
                    }
                }
            }}
        
        
        
    }
    
    func deleteCartFoodI(sepet_yemek_id: String, kullanici_adi: String) {
        if kullanici_adi ==  Auth.auth().currentUser?.email{
            let param : Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: param).response { response in
                if let data = response.data {
                    do{
                       let answer = try JSONSerialization.jsonObject(with: data)
                        print(answer)
                        
                        self.getCartFoodI()
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                    
                }}
            
            
        }}
}
