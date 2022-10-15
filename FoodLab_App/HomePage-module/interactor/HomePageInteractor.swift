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
    
    func getAllFoodsI() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response{response in
            if let data = response.data{
                do{
                    let answer = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    if let foods = answer.yemekler{
                        
                        self.homePagePresenter?.sendDataToPresenter(foods: foods)
                    }
                    
                }catch{
                    print(error.localizedDescription.description)
                }
            }
        }
                   

    }
    
    
}
