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
