//
//  RestoranPageVC.swift
//  FoodLab_App
//
//  Created by Que on 19.10.2022.
//

import UIKit

class RestoranPageVC: UIViewController {

    @IBOutlet weak var categorySegment: UISegmentedControl!
    var restArray : [Restaurant] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        setRestArray()
        cellDesign()
        collectionView.dataSource = self
        collectionView.delegate = self
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func categorySegmentDegisim(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        setRestArray()
       
        switch index{
        case 0:
            print("0")
            setRestArray()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            break
        case 1:
            print("1")
            let f1 = restArray.filter({($0.category!)=="Kahve"})
            restArray = f1
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            break
        case 2:
            print("2")
            let f1 = restArray.filter({($0.category!)=="Pizza"})
            restArray = f1
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            break
        case 3:
            print("3")
            let f1 = restArray.filter({($0.category!)=="Burger"})
            restArray = f1
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            break
        case 4:
            let f1 = restArray.filter({($0.category!)=="Tavuk"})
            restArray = f1
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            break
        default:
            break
        }
    
    }
    
    
    
    

    func setRestArray(){
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

extension RestoranPageVC : UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let rest = restArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestoranCollectionViewCell", for: indexPath) as! RestoranCollectionViewCell
        cell.imageRestoran.image = UIImage(named: rest.image!)
        cell.labelCatRest.text = rest.category!
        cell.labelNameRest.text = rest.name!
        cell.labelStarRest.text = String(rest.star!)
        
        return cell
        
    }
    func cellDesign(){
        let tasarim = UICollectionViewFlowLayout()
         //tasarim.scrollDirection = .horizontal
         tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
         
         tasarim.minimumLineSpacing = 10 // dikey
         
        
        let width = collectionView.bounds.width-1
         tasarim.itemSize = CGSize(width: width, height: 127 )
         collectionView.collectionViewLayout = tasarim
         
    }
    
    
    
}
