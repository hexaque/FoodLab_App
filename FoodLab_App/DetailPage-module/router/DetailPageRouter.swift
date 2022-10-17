//
//  DetailPageRouter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class DetailPageRouter{
    static func createModule(ref: DetailPageVC){
        let presenter = DetailPagePresenter()
        ref.detailPagePresenterObject = presenter
        ref.detailPagePresenterObject?.detailPageInteractor = DetailPageInteractor()
        ref.detailPagePresenterObject?.detailPageInteractor?.detailPagePresenter = presenter
        ref.detailPagePresenterObject?.detailPageView = ref
        
    }
}
