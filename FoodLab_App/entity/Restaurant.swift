//
//  Restorant.swift
//  FoodLab_App
//
//  Created by Que on 19.10.2022.
//

import Foundation
class Restaurant{

    
    var name: String?
    var category: String?
    var image: String?
    var star: Double?
    
    
    init(name: String, category: String, image: String, star: Double) {
        self.name = name
        self.category = category
        self.image = image
        self.star = star
    }
}
