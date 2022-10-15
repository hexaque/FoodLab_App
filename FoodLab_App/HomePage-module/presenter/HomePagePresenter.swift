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
    
    func getAllFoods() {
        homePageInteractor?.getAllFoodsI()
    }
    
    func sendDataToPresenter(foods: [Foods]) {
        
        homePageView?.sendDataToView(foods: foods)
     

        
    }
    
    
}
