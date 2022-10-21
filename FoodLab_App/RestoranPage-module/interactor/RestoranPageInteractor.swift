//
//  RestoranPageInteractor.swift
//  FoodLab_App
//
//  Created by Que on 21.10.2022.
//

import Foundation
class RestoranPageInteractor:PresenterToInteractorRestoranPageProtocol{
    var restArray : [Restaurant] = []
    func filterRestI(segmentIndex: Int) {
        refreshArray()
        switch segmentIndex{
        case 0:
            getAllRestI()
            break
        case 1:
            
            let f1 = restArray.filter({($0.category!)=="Kahve"})
            restArray = f1
            
            restoranPagePresenter?.filterDataToPresener(data: restArray)
            
            break
        case 2:
            
            let f1 = restArray.filter({($0.category!)=="Pizza"})
            restArray = f1
            restoranPagePresenter?.filterDataToPresener(data: restArray)
            break
        case 3:
            
            let f1 = restArray.filter({($0.category!)=="Burger"})
            restArray = f1
            restoranPagePresenter?.filterDataToPresener(data: restArray)
            
            break
        case 4:
            let f1 = restArray.filter({($0.category!)=="Tavuk"})
            restArray = f1
            restoranPagePresenter?.filterDataToPresener(data: restArray)
            
            break
        default:
            break
        }
    
    
    
    
    
    }
    
    
    var restoranPagePresenter: InteractorToPresenterRestoranPageProtocol?
    func getAllRestI() {
        self.refreshArray()
        restoranPagePresenter?.dataToPresenter(data: restArray)
        
    }
    func refreshArray(){
        
        restArray = [
         Restaurant(name: "Dominos", category: "Pizza", image: "dominos", star:3.5),
         Restaurant(name: "Burger King", category: "Burger", image: "burgerking", star:3.8),
         Restaurant(name: "Starbucks", category: "Kahve", image: "starbucks", star:3.9),
         Restaurant(name: "McDonalds", category: "Burger", image: "mcdonalds", star:3.6),
         Restaurant(name: "Popeyes", category: "Tavuk", image: "popeyes", star:3.3),
         Restaurant(name: "Pizza Locale", category: "Pizza", image: "pizzalocale", star:3.9),
         Restaurant(name: "Kahve Dünyası", category: "Kahve", image: "kahvedunyasi", star:3.1)]
        
    }
    
    
    
    
}
