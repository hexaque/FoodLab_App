//
//  DetailPageInteractor.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class DetailPageInteractor:PresenterToInteractorDetailPageProtocol{
    var detailPagePresenter: InteractorToPresenterDetailPageProtocol?
    var adet = 1
    
    func addCartI(food: Foods) {
        
    }
    
    func minusI() {
        adet -= 1
        detailPagePresenter?.adetDataToPresenter(number: adet)
        
    }
    
    func plusI() {
        adet += 1
        detailPagePresenter?.adetDataToPresenter(number: adet)
    }
    
    func setTotalPriceI(price:Int) {
        var totalPrice = price * adet
        detailPagePresenter?.totalPriceDataToPresenter(number: totalPrice)
        
    }
    
    
}
