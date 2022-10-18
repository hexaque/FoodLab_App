//
//  CartPagePresenter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class CartPagePresenter:ViewToPresenterCartPageProtocol,InteractorToPresenterCartPageProtocol{
   
    var cartPageInteractor: PresenterToInteractorCartPageProtocol?
    
    var cartPageView: PresenterToViewCartPageProtocol?
   
    
    func getCartFood() {
        cartPageInteractor?.getCartFoodI()
    }
    
    func deleteCartFood(sepet_yemek_id: Int, kullanici_adi: String) {
        cartPageInteractor?.deleteCartFoodI(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
    func sendDataToPresenter(foodsCart: [FoodsCart]) {
        cartPageView?.sendDataToView(foodsCart: foodsCart)
    }
    
}
