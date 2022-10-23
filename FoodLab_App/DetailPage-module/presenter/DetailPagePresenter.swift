//
//  DetailPagePresenter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class DetailPagePresenter:ViewToPresenterDetailPageProtocol,InteractorToPresenterDetailPageProtocol{
    var detailPageInteractor: PresenterToInteractorDetailPageProtocol?
    
    var detailPageView: PresenterToViewDetailPageProtocol?
    
    func isFaved(food:Foods){
        detailPageInteractor?.isFavedI(food:food)
    }
    func addFav(food:Foods){
        detailPageInteractor?.addFavI(food:food)
    }
    
    func deleteFav(food:Foods){
        detailPageInteractor?.deleteFavI(food: food)
    }
    func deleteFromCart(sepet_yemek_id: String, kullanici_adi: String) {
        detailPageInteractor?.deleteFromCartI(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
   
    
    func cartInfoToPresenter(cartFood: [FoodsCart]) {
        detailPageView?.cartInfoToView(cartFood: cartFood)
    }
    
    func addToCart(food: Foods, adet: String) {
        detailPageInteractor?.addToCartI(food: food, adet: adet)
    }
    
    func getCartInfo() {
        detailPageInteractor?.getCartInfoI()
    }
   
    
   

    
    func minus() {
        detailPageInteractor?.minusI()
    }
    
    func plus() {
        detailPageInteractor?.plusI()
    }
    
    func setTotalPrice(price:Int) {
        detailPageInteractor?.setTotalPriceI(price: price)
    }
    

    
    func adetDataToPresenter(number: Int) {
        detailPageView?.adetDataToView(number: number)
       
    }
    
    func totalPriceDataToPresenter(number: Int) {
        detailPageView?.totalPriceDataToView(number: number)
       
    }
    func isFavedToPresenter(isFaved: Bool) {
        detailPageView?.isFavedToView(isFaved: isFaved)
    }
    
    
}
