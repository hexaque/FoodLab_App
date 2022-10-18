//
//  CartPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit
import Kingfisher
class CartPageVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    var cartPagePresenterObject : ViewToPresenterCartPageProtocol?
   
    var allFoodsCart = [FoodsCart]()
    override func viewDidLoad() {
        CartPageRouter.createModule(ref: self)
        tableView.dataSource = self
        tableView.delegate = self
        
        super.viewDidLoad()

        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        cartPagePresenterObject?.getCartFood()
    }

  

}





extension CartPageVC : PresenterToViewCartPageProtocol{
    func sendDataToView(foodsCart: [FoodsCart], totalPrice: Int) {
        self.allFoodsCart = foodsCart
        self.totalPrice.text = String(totalPrice)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
  
    
}





extension CartPageVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFoodsCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let url = "http://kasimadalan.pe.hu/yemekler/resimler/"
        let tempFood = allFoodsCart[indexPath.row]
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartPageTableViewCell") as! CartPageTableViewCell
        
       
      
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
        
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
            let food = self.allFoodsCart[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(food.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.cartPagePresenterObject?.deleteCartFood(sepet_yemek_id: food.sepet_yemek_id!, kullanici_adi: food.kullanici_adi!)
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    }
    
    



