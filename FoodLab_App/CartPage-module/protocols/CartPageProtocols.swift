//
//  CartPageProtocols.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
protocol ViewToPresenterCartPageProtocol{
    var cartPageInteractor : PresenterToInteractorCartPageProtocol?{get set}
}
protocol PresenterToInteractorCartPageProtocol{
    
}
protocol PresenterToRouterCartPageProtocol{
    static func createModule(ref: CartPageVC)
}
