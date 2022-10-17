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
    
    func addCart(food: Foods) {
        detailPageInteractor?.addCartI(food: food)
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
    
    
}
