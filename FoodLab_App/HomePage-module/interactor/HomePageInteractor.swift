//
//  HomePageInteractor.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import Foundation
import Alamofire
class HomePageInteractor : PresenterToInteractorHomePageProtocol{
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    var allFoods = [Foods]()
    
    
    func searchFoodsI(searchText: String) {
        var searchFoods = [Foods]()
        for food in allFoods{
            if food.yemek_adi!.lowercased().contains(searchText.lowercased()) {
                searchFoods.append(food)
                
            }
        }
        self.homePagePresenter?.sendDataToPresenter(foods: searchFoods)
    }
    
  
    func getAllFoodsI() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response{response in
            if let data = response.data{
                do{
                    let answer = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    if let foods = answer.yemekler{
                        self.allFoods = foods
                        self.homePagePresenter?.sendDataToPresenter(foods: foods)
                    }
                    
                }catch{
                    print(error.localizedDescription.description)
                }
            }
        }
                   

    }
    
    
    func filteredFoodsI(price:Int ,sirala:String){
        let f1 = allFoods.filter({Int($0.yemek_fiyat!)!<price})
        allFoods = f1
        if sirala == "Fiyata göre küçükten büyüğe sırala"{
            self.allFoods.sort(by: { Int($0.yemek_fiyat!)! < Int($1.yemek_fiyat!)! })
            self.homePagePresenter?.sendDataToPresenter(foods: allFoods)
           
            
        }else if sirala == "Fiyata göre büyükten küçüğe sırala"{
            
            self.allFoods.sort(by: { Int($0.yemek_fiyat!)! > Int($1.yemek_fiyat!)! })
            self.homePagePresenter?.sendDataToPresenter(foods: allFoods)
           
        }else{
            self.homePagePresenter?.sendDataToPresenter(foods: allFoods)
        }

    }
    
    
    
    
    
    
    
}
