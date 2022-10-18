//
//  CartPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit
import Kingfisher
class CartPageVC: UIViewController {
    
    var cartPagePresenterObject : ViewToPresenterCartPageProtocol?
    @IBOutlet weak var collectionView: UICollectionView!
    var allFoodsCart = [FoodsCart]()
    override func viewDidLoad() {
        CartPageRouter.createModule(ref: self)
        collectionView.dataSource = self
        collectionView.delegate = self
        cellDesign()
        super.viewDidLoad()

        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        cartPagePresenterObject?.getCartFood()
    }

  

}





extension CartPageVC : PresenterToViewCartPageProtocol{
    func sendDataToView(foodsCart: [FoodsCart]) {
        self.allFoodsCart = foodsCart
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
}







extension CartPageVC : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFoodsCart.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let url = "http://kasimadalan.pe.hu/yemekler/resimler/"
        let tempFood = allFoodsCart[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartPageCollectionViewCell", for: indexPath) as! CartPageCollectionViewCell
        
      
        if let url = URL(string: "\(url)\(tempFood.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                cell.imageFood.kf.setImage(with : url)
            }
            
        }
        
        cell.labelName.text = tempFood.yemek_adi
        
        if let foodPrice = Int(tempFood.yemek_fiyat!) , let foodAdetInt = Int(tempFood.yemek_siparis_adet!){
   
        let totalFoodPrice = foodPrice * foodAdetInt
        cell.labelPrice.text = "\(totalFoodPrice)₺"
            cell.labelAdet.text = "\(tempFood.yemek_siparis_adet!) adet"
        }
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
         
         
        let hucreGenisligi = collectionView.bounds.width
         tasarim.itemSize = CGSize(width: hucreGenisligi, height: 100)
        
         collectionView.collectionViewLayout = tasarim
    }
    
}
