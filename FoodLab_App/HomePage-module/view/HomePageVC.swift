//
//  HomePageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit
import Kingfisher
import FirebaseAuth
class HomePageVC: UIViewController {
    
    @IBOutlet weak var foodsCollectionView: UICollectionView!
    var homePagePresenterObject : ViewToPresenterHomePageProtocol?
    var allFoods = [Foods]()
    var tempAllFoods = [Foods]()
    var priceFilter = 30
    var siralama = ""
    override func viewDidLoad() {
        foodsCollectionView.delegate = self
        foodsCollectionView.dataSource = self
        HomePageRouter.createModule(ref: self)
        homePagePresenterObject?.getAllFoods()
        cellDesign()
        
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    
    func priceFilterFunc(price:Int ,sirala:String){
        print("b")
        let f1 = allFoods.filter({Int($0.yemek_fiyat!)!<price})
        allFoods = f1
        if sirala == "Fiyata göre küçükten büyüğe sırala"{
            self.allFoods.sort(by: { Int($0.yemek_fiyat!)! < Int($1.yemek_fiyat!)! })
            DispatchQueue.main.async {
                
                self.foodsCollectionView.reloadData()
            }
            
        }else if sirala == "Fiyata göre büyükten küçüğe sırala"{
            
            self.allFoods.sort(by: { Int($0.yemek_fiyat!)! > Int($1.yemek_fiyat!)! })
            DispatchQueue.main.async {
                self.foodsCollectionView.reloadData()
            }
        }
        else{ DispatchQueue.main.async {
            self.foodsCollectionView.reloadData()
        }
            
        }
       
            
    }
    

    @IBAction func buttonFilterPage(_ sender: Any) {
        performSegue(withIdentifier: "toFilterPage", sender: nil)
    }
   
    
    @IBAction func buttonClearFilter(_ sender: Any) {
        priceFilter = 100
        siralama = " "
        homePagePresenterObject?.getAllFoods()
    }
    
    
}

extension HomePageVC:FilterPageToHomePage{
    func SendSiralamaAndFilterToHomePage(filter: Int, siralama: String) {
        self.priceFilter = filter
        self.siralama = siralama
        print("homepagefunc")
        homePagePresenterObject?.getAllFoods()
    }
    
    
}


extension HomePageVC : PresenterToViewHomePageProtocol{
    func sendDataToView(foods: [Foods]) {
        
        self.allFoods = foods
        self.tempAllFoods = foods
        
        priceFilterFunc(price:priceFilter ,sirala:siralama)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = allFoods[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let food = sender as? Foods {
                let gidilecekVC = segue.destination as! DetailPageVC
                gidilecekVC.food = food
            }
        }
        if segue.identifier == "toFilterPage" {
            let gidilecekVC = segue.destination as! FilterPageVC
            gidilecekVC.delegate=self
        }
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
