//
//  CartPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit

class CartPageVC: UIViewController {
    var cartPagePresenterObject : ViewToPresenterCartPageProtocol?
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

  

}





extension CartPageVC : PresenterToViewCartPageProtocol{
    
}







extension CartPageVC : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
  
    
    
    
}
