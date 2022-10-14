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
    
    
}
protocol PresenterToInteractorHomePageProtocol{
    var homePagePresenter : InteractorToPresenterHomePageProtocol?{get set}
    
}



protocol InteractorToPresenterHomePageProtocol{
    
}

protocol PresenterToViewHomePageProtocol{
    
}


protocol PresenterToRouterHomePageProtocol{
    static func createModule(ref: HomePageVC)
}
