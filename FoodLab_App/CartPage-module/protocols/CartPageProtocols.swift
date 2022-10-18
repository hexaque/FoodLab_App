//
//  CartPageProtocols.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
protocol ViewToPresenterCartPageProtocol{
    var cartPageInteractor : PresenterToInteractorCartPageProtocol?{get set}
    var cartPageView :PresenterToViewCartPageProtocol?{get set}
    func getCartFood()
    func deleteCartFood(sepet_yemek_id:String, kullanici_adi:String)
}
protocol PresenterToInteractorCartPageProtocol{
    var cartPagePresenter : InteractorToPresenterCartPageProtocol?{get set}
    func getCartFoodI()
    func deleteCartFoodI(sepet_yemek_id:String, kullanici_adi:String)
}

protocol InteractorToPresenterCartPageProtocol{
    func sendDataToPresenter(foodsCart:[FoodsCart],totalPrice:Int)
}

protocol PresenterToViewCartPageProtocol{
    func sendDataToView(foodsCart:[FoodsCart],totalPrice:Int)
}



protocol PresenterToRouterCartPageProtocol{
    static func createModule(ref: CartPageVC)
}
