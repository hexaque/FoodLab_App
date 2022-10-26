//
//  RestoranPageVC.swift
//  FoodLab_App
//
//  Created by Que on 19.10.2022.
//

import UIKit

class RestoranPageVC: UIViewController {
    var restoranPagePresenterObject:ViewToPresenterRestoranPageProtocol?
    var timer: Timer?
    var sliderIndex = 0
    
    @IBOutlet weak var categorySegment: UISegmentedControl!
    var restArray : [Restaurant] = []
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var restoranCollectionView: UICollectionView!
    var advertisingSliderPhotos = [UIImage(named: "1")!,
                                   UIImage(named: "2")!,
                                   UIImage(named: "3")!,
                                   UIImage(named: "4")!]
    override func viewDidLoad() {
       cell2Design()
        timerSetup()
        RestoranPageRouter.createModule(ref: self)
        restoranPagePresenterObject?.getAllRest()
        cellDesign()
        restoranCollectionView.dataSource = self
        restoranCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        super.viewDidLoad()
      
        
    }
    
    func timerSetup() {
           timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(sliderNextIndex), userInfo: nil, repeats: true)
       }
       
       @objc func sliderNextIndex() {
           
           if sliderIndex < advertisingSliderPhotos.count - 1 {
               sliderIndex += 1
           }else {
               sliderIndex = 0
           }
           
           sliderCollectionView.scrollToItem(at: IndexPath(item: sliderIndex, section: 0), at: .centeredHorizontally, animated: true)
           
       }
    
    
    
    @IBAction func categorySegmentDegisim(_ sender: UISegmentedControl) {
        let indexSegment = sender.selectedSegmentIndex
        restoranPagePresenterObject?.filterRest(segmentIndex: indexSegment)
       
       
    
    }
    

}

extension RestoranPageVC : UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case sliderCollectionView:
            return advertisingSliderPhotos.count
            
      
        default:
            return restArray.count
            
       
        }  }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
            
        case sliderCollectionView:
            let advertisingImage = advertisingSliderPhotos[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
            cell.sliderImage.image = advertisingImage
           
            return cell
        
        
        default:
            let rest = restArray[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestoranCollectionViewCell", for: indexPath) as! RestoranCollectionViewCell
            cell.imageRestoran.image = UIImage(named: rest.image!)
            cell.labelCatRest.text = rest.category!
            cell.labelNameRest.text = rest.name!
            cell.labelStarRest.text = String(rest.star!)
            
            return cell
        
        
        
        
        
        
    }}
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case sliderCollectionView:
          break
            
      
        default:
            let restoran = restArray[indexPath.row]
            performSegue(withIdentifier: "restoranToHomePage",sender: restoran )
            collectionView.deselectItem(at: indexPath, animated: true)
            
       
        }
        
        
        
       
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
         
        
        let width = restoranCollectionView.bounds.width-20
         tasarim.itemSize = CGSize(width: width, height: 120 )
        restoranCollectionView.collectionViewLayout = tasarim
    
    }
    func cell2Design(){
        let tasarim = UICollectionViewFlowLayout()
         
         
        tasarim.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
        tasarim.scrollDirection = .horizontal
        
        let width = sliderCollectionView.bounds.width - 10
        
         tasarim.itemSize = CGSize(width: width, height: sliderCollectionView.bounds.height-10 )
        sliderCollectionView.collectionViewLayout = tasarim
    }
    
    
    
}

extension RestoranPageVC:PresenterToViewRestoranPageProtocol{
    func filterDataToView(data: [Restaurant]) {
        self.restArray = data
        DispatchQueue.main.async {
            self.restoranCollectionView.reloadData()
        }
    }
    
    func dataToView(data: [Restaurant]) {
        self.restArray = data
        DispatchQueue.main.async {
            self.restoranCollectionView.reloadData()
        }
    }
    
    
}


