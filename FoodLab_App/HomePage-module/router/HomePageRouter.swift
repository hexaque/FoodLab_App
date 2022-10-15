//
//  HomePageRouter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class HomePageRouter:PresenterToRouterHomePageProtocol{
    static func createModule(ref: HomePageVC) {
        let presenter = HomePagePresenter()
        ref.homePagePresenterObject = HomePagePresenter()
        ref.homePagePresenterObject?.homePageInteractor = HomePageInteractor()
        ref.homePagePresenterObject?.homePageInteractor?.homePagePresenter = presenter
    }
    
    
    
}
