//
//  CartPageRouter.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
class CartPageRouter:PresenterToRouterCartPageProtocol{
    static func createModule(ref: CartPageVC) {
        
        let presenter = CartPagePresenter()
        ref.cartPagePresenterObject = presenter
        ref.cartPagePresenterObject?.cartPageInteractor = CartPageInteractor()
        ref.cartPagePresenterObject?.cartPageView = ref
        ref.cartPagePresenterObject?.cartPageInteractor?.cartPagePresenter = presenter
        
    }}
