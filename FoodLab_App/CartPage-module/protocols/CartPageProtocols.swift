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
    func getCardFood(kullanici_adi:String)
    func deleteCardFood(sepet_yemek_id:Int, kullanici_adi:String)
}
protocol PresenterToInteractorCartPageProtocol{
    var cartPagePresenter : InteractorToPresenterCartPageProtocol?{get set}
    func getCardFoodI(kullanici_adi:String)
    func deleteCardFoodI(sepet_yemek_id:Int, kullanici_adi:String)
}

protocol InteractorToPresenterCartPageProtocol{
    func sendDataToPresenter(foodsCart:[FoodsCart])
}

protocol PresenterToViewCartPageProtocol{
    func sendDataToView(foodsCart:[FoodsCart])
}



protocol PresenterToRouterCartPageProtocol{
    static func createModule(ref: CartPageVC)
}
