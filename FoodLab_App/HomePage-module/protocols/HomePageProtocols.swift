//
//  HomePageProtocols.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation

protocol ViewToPresenterHomePageProtocol{
    var homePageInteractor : PresenterToInteractorHomePageProtocol?{get set}
    var homePageView : PresenterToViewHomePageProtocol?{get set}
    func getAllFoods()
    func filteredFoods(price:Int ,sirala:String)
    func searchFoods(searchText:String)
    
}
protocol PresenterToInteractorHomePageProtocol{
    var homePagePresenter : InteractorToPresenterHomePageProtocol?{get set}
    func getAllFoodsI()
    func filteredFoodsI(price:Int ,sirala:String)
    func searchFoodsI(searchText:String)
}



protocol InteractorToPresenterHomePageProtocol{
    func sendDataToPresenter(foods:[Foods])
}

protocol PresenterToViewHomePageProtocol{
   func sendDataToView(foods:[Foods])
}


protocol PresenterToRouterHomePageProtocol{
    static func createModule(ref: HomePageVC)
}
