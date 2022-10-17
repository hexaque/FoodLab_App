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
    func addCart(food:Foods)
    func minus()
    func plus()
    func setTotalPrice(price:Int)
}
protocol PresenterToInteractorDetailPageProtocol{
    var detailPagePresenter : InteractorToPresenterDetailPageProtocol?{get set}
    func addCartI(food:Foods)
    func minusI()
    func plusI()
    func setTotalPriceI(price:Int)
}

protocol InteractorToPresenterDetailPageProtocol{

    func adetDataToPresenter(number:Int)
    func totalPriceDataToPresenter(number:Int)
}

protocol PresenterToViewDetailPageProtocol{
    func adetDataToView(number:Int)
    func totalPriceDataToView(number:Int)
}














protocol PresenterToRouterDetailPageProtocol{
    static func createModule(ref: DetailPageVC)
}
