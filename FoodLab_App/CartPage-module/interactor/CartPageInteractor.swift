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
        if let email = userEmail{
            
            
            let param : Parameters = ["kullanici_adi":email]
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response { response in
                if let data = response.data {
                    do {
                        let answer = try JSONDecoder().decode(FoodsCartResponse.self, from: data)
                        
                        if let answerArray = answer.sepet_yemekler {
                            print("succes")
                            self.cartPagePresenter?.sendDataToPresenter(foodsCart: answerArray)
                        }
                        
                    } catch  {
                        print(error.localizedDescription)
                    }
                }
            }}
        
        
        
    }
    
    func deleteCartFoodI(sepet_yemek_id: Int, kullanici_adi: String) {
        
    }
    
    
}
