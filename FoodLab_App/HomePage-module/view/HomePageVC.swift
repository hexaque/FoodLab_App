//
//  HomePageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit
import Kingfisher
class HomePageVC: UIViewController {
    
    @IBOutlet weak var foodsCollectionView: UICollectionView!
    var homePagePresenterObject : ViewToPresenterHomePageProtocol?
    var allFoods = [Foods]()
    override func viewDidLoad() {
        foodsCollectionView.delegate = self
        foodsCollectionView.dataSource = self
        HomePageRouter.createModule(ref: self)
        homePagePresenterObject?.getAllFoods()
        cellDesign()
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
    }
    

   

}


extension HomePageVC : PresenterToViewHomePageProtocol{
    func sendDataToView(foods: [Foods]) {
        
        self.allFoods = foods
        
        DispatchQueue.main.async {
            self.foodsCollectionView.reloadData()
        }
    }
}




extension HomePageVC : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let url = "http://kasimadalan.pe.hu/yemekler/resimler/"
        let tempFood = allFoods[indexPath.row]
        let cell = foodsCollectionView.dequeueReusableCell(withReuseIdentifier: "UrunlerCollectionViewCell", for: indexPath) as! UrunlerCollectionViewCell
        
      
        if let url = URL(string: "\(url)\(tempFood.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                cell.imageFood.kf.setImage(with : url)
            }
            
        }
        cell.labelFoodName.text = tempFood.yemek_adi
        cell.labelFoodPrice.text = "\(tempFood.yemek_fiyat!)₺"
        
        cell.layer.shadowRadius = 5
        cell.layer.shadowOffset = .zero
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowColor = UIColor.black.cgColor
        
        cell.layer.masksToBounds = false

        return cell
    }

    func cellDesign(){
        let tasarim = UICollectionViewFlowLayout()
        
         tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
         tasarim.minimumInteritemSpacing = 0 // yatay
         tasarim.minimumLineSpacing = 15 // dikey
         
         
        let hucreGenisligi = foodsCollectionView.bounds.width
         tasarim.itemSize = CGSize(width: hucreGenisligi, height: 100)
        
         foodsCollectionView.collectionViewLayout = tasarim
    }
}
