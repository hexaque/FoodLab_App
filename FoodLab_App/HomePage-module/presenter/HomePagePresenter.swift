//
//  HomePagePresenter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class HomePagePresenter: ViewToPresenterHomePageProtocol,InteractorToPresenterHomePageProtocol{
    var homePageInteractor: PresenterToInteractorHomePageProtocol?
    var homePageView: PresenterToViewHomePageProtocol?
    
    
    
    func searchFoods(searchText: String) {
        homePageInteractor?.searchFoodsI(searchText: searchText)
    }
    
    func filteredFoods(price: Int, sirala: String) {
        homePageInteractor?.filteredFoodsI(price: price, sirala: sirala)
    }
    
    
    func getAllFoods() {
        homePageInteractor?.getAllFoodsI()
    }
    
    func sendDataToPresenter(foods: [Foods]) {
        
        homePageView?.sendDataToView(foods: foods)
     

        
    }
    
    
}
