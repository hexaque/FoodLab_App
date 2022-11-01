//
//  protocols.swift
//  FoodLab_App
//
//  Created by Que on 18.10.2022.
//

import Foundation
protocol FilterPageToHomePage{
    func SendSiralamaAndFilterToHomePage(filter:Int,siralama:String)
    
}
protocol DetailPageToHomePage{
    func sendBadgeCountToHomePage(badgeCount:Int)
}

protocol OrderDetailToCartPage{
    func deleteCart()
}

protocol CartPlusOrMinus{
    func cartPlus(indexPath: IndexPath)
    func cartMinus(indexPath: IndexPath)
}


protocol FavFoodUserPage{
    func favFood(indexPath:IndexPath)
}
