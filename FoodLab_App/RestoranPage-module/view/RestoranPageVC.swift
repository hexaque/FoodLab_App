//
//  RestoranPageVC.swift
//  FoodLab_App
//
//  Created by Que on 19.10.2022.
//

import UIKit

class RestoranPageVC: UIViewController {
    var restoranPagePresenterObject:ViewToPresenterRestoranPageProtocol?
    @IBOutlet weak var siralamaButton: UIButton!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    var restArray : [Restaurant] = []

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {

        RestoranPageRouter.createModule(ref: self)
        restoranPagePresenterObject?.getAllRest()
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
        let indexSegment = sender.selectedSegmentIndex
        restoranPagePresenterObject?.filterRest(segmentIndex: indexSegment)
       
       
    
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

extension RestoranPageVC:PresenterToViewRestoranPageProtocol{
    func filterDataToView(data: [Restaurant]) {
        self.restArray = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func dataToView(data: [Restaurant]) {
        self.restArray = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
}
