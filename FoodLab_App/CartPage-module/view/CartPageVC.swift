//
//  CartPageVC.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit
import Kingfisher
class CartPageVC: UIViewController {
    
    
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var totalPrice2: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    var totalCartPrice = 0
    var cartPagePresenterObject : ViewToPresenterCartPageProtocol?
   
    var allFoodsCart = [FoodsCart]()
    override func viewDidLoad() {
       
        
       
        
        CartPageRouter.createModule(ref: self)
        tableView.dataSource = self
        tableView.delegate = self
        
        super.viewDidLoad()

        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
       
        cartPagePresenterObject?.getCartFood()
        
    }

  

    @IBAction func buttonDeleteAll(_ sender: Any) {
        indicator.startAnimating()
        let alert = UIAlertController(title: "Sepeti boşalt", message: "Sepetinizdeki tüm ürünler silinecek emin misiniz ? ", preferredStyle: .alert)
        
        let okeyAction = UIAlertAction(title: "Tamam", style: .cancel){action in
            for i in self.allFoodsCart{
                self.cartPagePresenterObject?.deleteCartFood(sepet_yemek_id: i.sepet_yemek_id!, kullanici_adi: i.kullanici_adi!)
            }
        }
        let cancelAction = UIAlertAction(title: "İptal", style: .default)
        indicator.stopAnimating()
        alert.addAction(okeyAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        
     
        
    }
    
    
    
    
    
    @IBAction func buttonOnay(_ sender: Any) {
    
        if totalCartPrice > 0 {
            let stringPrice = String(totalCartPrice)
                performSegue(withIdentifier: "toOrderDetailPage", sender: stringPrice)
            }
        
        
        
        
        
        
        //toOrderDetailPage
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrderDetailPage"{
            if let price = sender as? String{
                let gidilecekVC = segue.destination as! OrderDetailVC
                gidilecekVC.price = price
                gidilecekVC.delegate = self
            
            }
        }
    }
    
    
    
    
}





extension CartPageVC : PresenterToViewCartPageProtocol{
    func sendDataToView(foodsCart: [FoodsCart], totalPrice: Int) {
        indicator.startAnimating()
        self.allFoodsCart = foodsCart
        self.totalCartPrice = totalPrice
       self.totalPrice.text = "\(String(totalPrice))₺"
        self.totalPrice2.text = "\(String(totalPrice))₺"
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
      
        indicator.stopAnimating()
        
        
        if let tabItems = tabBarController?.tabBar.items{
            let cartItem = tabItems[0]
            let temp = self.allFoodsCart.count
            if temp > 0{
                cartItem.badgeValue = String(temp)
            }else{
                cartItem.badgeValue = nil
            }
           
            
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
        
        cell.delegate = self
        cell.indexPath = indexPath
      
        if let url = URL(string: "\(url)\(tempFood.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                cell.imageFood.kf.setImage(with : url)
            }
            
        }
        
        cell.labelName.text = tempFood.yemek_adi
        
        if let foodPrice = Int(tempFood.yemek_fiyat!) , let foodAdetInt = Int(tempFood.yemek_siparis_adet!){
   
        let totalFoodPrice = foodPrice * foodAdetInt
            
        cell.labelPrice.text = "\(totalFoodPrice)₺"
            cell.labelAdet.text = "\(tempFood.yemek_siparis_adet!)"
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
    
    



extension CartPageVC:OrderDetailToCartPage{
    func deleteCart() {
        for i in allFoodsCart{
            cartPagePresenterObject?.deleteCartFood(sepet_yemek_id: i.sepet_yemek_id!, kullanici_adi: i.kullanici_adi!)
        }
        self.cartPagePresenterObject?.getCartFood()
    }
    
    
}


extension CartPageVC:CartPlusOrMinus{
    
    func cartPlus(indexPath: IndexPath ) {
        
        indicator.startAnimating()
        let cartFood = allFoodsCart[indexPath.row]
        var adet = cartFood.yemek_siparis_adet
         
        var adetInt = Int(adet!)!
        if adetInt < 20 {
            adetInt += 1
            adet = String(adetInt)
            cartPagePresenterObject?.changeCartFoodCount(yemek_adi: cartFood.yemek_adi!, yemek_resim_adi: cartFood.yemek_resim_adi!, yemek_fiyat: cartFood.yemek_fiyat!,sepet_yemek_id: cartFood.sepet_yemek_id!, yeniAdet: adet!)
        }
        else{
            let alert = UIAlertController(title: "En fazla 20 adet Sipariş verebilirsiniz.", message: "", preferredStyle: .alert)
            
            let okeyAction = UIAlertAction(title: "Tamam", style: .cancel)
            alert.addAction(okeyAction)
            self.present(alert, animated: true)
            indicator.stopAnimating()
        }
        
      
       
       
        
    }
    func cartMinus(indexPath: IndexPath) {
        
        indicator.startAnimating()
        let cartFood = allFoodsCart[indexPath.row]
        var adet = cartFood.yemek_siparis_adet
        var adetInt = Int(adet!)!
        if adetInt > 1{
            adetInt -= 1
        adet = String(adetInt)
        cartPagePresenterObject?.changeCartFoodCount(yemek_adi: cartFood.yemek_adi!, yemek_resim_adi: cartFood.yemek_resim_adi!, yemek_fiyat: cartFood.yemek_fiyat!,sepet_yemek_id: cartFood.sepet_yemek_id!, yeniAdet: adet!)
        }
        else if adetInt == 1{
            let alert = UIAlertController(title: "Ürün silinece", message: "Sepetinizde \(cartFood.yemek_adi!) 1 adet var. Silmek istediğinize Emin misiniz ? ", preferredStyle: .alert)
            
            let okeyAction = UIAlertAction(title: "Tamam", style: .default){action in
                self.cartPagePresenterObject?.deleteCartFood(sepet_yemek_id: cartFood.sepet_yemek_id!, kullanici_adi: cartFood.kullanici_adi!)
                
            }
            let cancelAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(okeyAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
            indicator.stopAnimating()
        }
        else {
            print("Hata")
            indicator.stopAnimating()
        }
          
       
      
    }
}
