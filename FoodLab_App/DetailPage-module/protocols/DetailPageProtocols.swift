//
//  DetailPageProtocols.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
protocol ViewToPresenterDetailPageProtocol{
    var detailPageInteractor : PresenterToInteractorDetailPageProtocol?{get set}
    var detailPageView : PresenterToViewDetailPageProtocol?{get set}
    func getCartInfo()
    func deleteFromCart(sepet_yemek_id: String, kullanici_adi: String)
    func minus()
    func plus()
    func setTotalPrice(price:Int)
    func addToCart(food:Foods,adet:String)
    
}
protocol PresenterToInteractorDetailPageProtocol{
    var detailPagePresenter : InteractorToPresenterDetailPageProtocol?{get set}
    func getCartInfoI()
    func deleteFromCartI(sepet_yemek_id: String, kullanici_adi: String)
    func minusI()
    func plusI()
    func setTotalPriceI(price:Int)
    func addToCartI(food:Foods,adet:String)
}

protocol InteractorToPresenterDetailPageProtocol{
    func cartInfoToPresenter(cartFood:[FoodsCart])
    func adetDataToPresenter(number:Int)
    func totalPriceDataToPresenter(number:Int)
}

protocol PresenterToViewDetailPageProtocol{
    func cartInfoToView(cartFood:[FoodsCart])
    func adetDataToView(number:Int)
    func totalPriceDataToView(number:Int)
}














protocol PresenterToRouterDetailPageProtocol{
    static func createModule(ref: DetailPageVC)
}
