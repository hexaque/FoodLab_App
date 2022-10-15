//
//  HomePageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit

class HomePageVC: UIViewController {
    @IBOutlet weak var foodsCollectionView: UITableView!
    var homePagePresenterObject : ViewToPresenterHomePageProtocol?
    var allFoods = [Foods]()
    override func viewDidLoad() {
        foodsCollectionView.delegate = self
        foodsCollectionView.dataSource = self
        HomePageRouter.createModule(ref: self)
        homePagePresenterObject?.getAllFoods()
        
        super.viewDidLoad()

        
    }
    

   

}





extension HomePageVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempFood = allFoods[indexPath.row]
        let cell = foodsCollectionView.dequeueReusableCell(withIdentifier: "urunlerCell", for: indexPath) as! UrunlerCell
        
        cell.labelFoodName.text = tempFood.yemek_adi
        cell.labelFoodPrice.text = "\(tempFood.yemek_fiyat!)₺"
        return cell
    }
    
    
}
