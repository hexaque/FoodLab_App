//
//  DetailPagePresenter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class DetailPagePresenter:ViewToPresenterDetailPageProtocol,InteractorToPresenterDetailPageProtocol{
    func addToCart(food: Foods, adet: String) {
        detailPageInteractor?.addToCartI(food: food, adet: adet)
    }
    
   
    
    var detailPageInteractor: PresenterToInteractorDetailPageProtocol?
    
    var detailPageView: PresenterToViewDetailPageProtocol?

    
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
    
    
}
