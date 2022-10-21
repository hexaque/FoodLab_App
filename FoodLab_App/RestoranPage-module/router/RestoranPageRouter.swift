//
//  RestoranPageRouter.swift
//  FoodLab_App
//
//  Created by Que on 21.10.2022.
//

import Foundation
class RestoranPageRouter : PresenterToRouterRestoranPageProtocol{
    static func createModule(ref: RestoranPageVC) {
        let presenter = RestoranPagePresenter()
        ref.restoranPagePresenterObject = presenter
        ref.restoranPagePresenterObject?.restoranPageInteractor = RestoranPageInteractor()
        ref.restoranPagePresenterObject?.restoranPageView = ref
        ref.restoranPagePresenterObject?.restoranPageInteractor?.restoranPagePresenter = presenter
        
    }
    
    
}
