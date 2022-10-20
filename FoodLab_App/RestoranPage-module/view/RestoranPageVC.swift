//
//  RestoranPageVC.swift
//  FoodLab_App
//
//  Created by Que on 19.10.2022.
//

import UIKit

class RestoranPageVC: UIViewController {

    @IBOutlet weak var siralamaButton: UIButton!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    var restArray : [Restaurant] = []

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {

        
        setRestArray()
        cellDesign()
        collectionView.dataSource = self
        collectionView.delegate = self
        super.viewDidLoad()
      
        
    }
    
    /*func popdownButton(){
        let optionClosure = {(action : UIAction) in
            if action.title == "Puana göre küçükten büyüğe sırala"{
                self.restArray.sort(by: { ($0.star!) < ($1.star!) })
                self.collectionView.reloadData()
            }else if action.title == "Puana göre büyükten küçüğe sırala"{

                    self.restArray.sort(by: { ($0.star!) > ($1.star!) })
                self.collectionView.reloadData()
                }
            else{
                self.restArray.shuffle()
                self.collectionView.reloadData()
            }
            }
        
        popDownButton.menu = UIMenu(children:[
            UIAction(title: "Sırala:", handler: optionClosure),
            UIAction(title: "Puana göre küçükten büyüğe sırala",  handler: optionClosure),
            UIAction(title: "Puana göre büyükten küçüğe sırala", handler: optionClosure)])
        popDownButton.showsMenuAsPrimaryAction = true
        popDownButton.changesSelectionAsPrimaryAction = true
    }*/
    
    
    
    
    
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let restoran = restArray[indexPath.row]
        performSegue(withIdentifier: "restoranToHomePage",sender: restoran )
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "restoranToHomePage" {
            if let restoran = sender as? Restaurant {
                let gidilecekVC = segue.destination as! HomePageVC
                gidilecekVC.restoranName = restoran.name!
                gidilecekVC.restoranImage = restoran.image!
            }
        }
    }
    
    
    
    
    
    
    func cellDesign(){
        let tasarim = UICollectionViewFlowLayout()
         
         tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
         
         tasarim.minimumLineSpacing = 10 // dikey
         
        
        let width = collectionView.bounds.width-20
         tasarim.itemSize = CGSize(width: width, height: 120 )
         collectionView.collectionViewLayout = tasarim
         
    }
    
    
    
}
