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
                        
                        if let answerArray = answer.sepet_yemekler {
                            for food in answerArray{
                                foodTotalPrice = Int(food.yemek_siparis_adet!)! * Int(food.yemek_fiyat!)!
                                totalPrice += foodTotalPrice
                            }
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
