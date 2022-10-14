//
//  DetailPageProtocols.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
protocol ViewToPresenterDetailPageProtocol{
    var detailPageInteractor : PresenterToInteractorDetailPageProtocol?{get set}
    
}
protocol PresenterToInteractorDetailPageProtocol{
    
}
protocol PresenterToRouterDetailPageProtocol{
    static func createModule(ref: DetailPageVC)
}
