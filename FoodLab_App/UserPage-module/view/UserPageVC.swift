//
//  UserPageVC.swift
//  FoodLab_App
//
//  Created by Que on 18.10.2022.
//
// DÜZENLENECEK.
import UIKit
import FirebaseAuth
import FirebaseStorage
import Firebase
import Kingfisher
class UserPageVC: UIViewController {
    var ref =  Database.database().reference().child("users")
    
    @IBOutlet weak var favFoodsCollectionView: UICollectionView!
    @IBOutlet weak var TFName: UITextField!
    
    @IBOutlet weak var buttonDuzenle: UIButton!
    @IBOutlet weak var TFPhone: UITextField!
    @IBOutlet weak var TFSurname: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    var userPagePresenterObject : ViewToPresenterUserPageProtocol?
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var isEditinInfo = false
    var favFoodsList = [Foods]()
    
 
    
    override func viewDidLoad() {
        UserPageRouter.createModule(ref: self)
        favFoodsCollectionView.delegate = self
        favFoodsCollectionView.dataSource = self
        cellDesign()
        
        indicator.stopAnimating()
        self.hideKeyboardWhenTappedAround()
        //indicator.stopAnimating()
        TFName.isEnabled = false
        TFSurname.isEnabled = false
        TFPhone.isEnabled = false
        super.viewDidLoad()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.clipsToBounds = true

        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 5.0
        userPagePresenterObject?.getUserInfoFromFireBase()
        userPagePresenterObject?.getFavFoodList()
       
      
       
        
        navigationItem.hidesBackButton = true 
    
        
     
        
    }
    override func viewDidAppear(_ animated: Bool) {
        //
    }
  
    
    
    @IBAction func buttonDuzenle(_ sender: Any) {
        isEditinInfo = !isEditinInfo
        if isEditinInfo{
            let image = UIImage(named: "burger")
            buttonDuzenle.setImage(image, for: .normal)
            TFName.backgroundColor = UIColor.white
            TFSurname.backgroundColor = UIColor.white
            TFPhone.backgroundColor = UIColor.white
            
            TFName.isEnabled = true
            TFSurname.isEnabled = true
            TFPhone.isEnabled = true
            
         
           
                /*let alertContreller = UIAlertController(title: "Lütfen Bilgileriniz Doğru Girin ", message:"", preferredStyle: .alert)
                self.present(alertContreller, animated: true)
                let okeyAction = UIAlertAction(title: "Tamam", style: .default)
                alertContreller.addAction(okeyAction)*/
            
           
            
        }else {
            //save et
            TFName.backgroundColor = UIColor(named: "Gray5")
            TFSurname.backgroundColor = UIColor(named: "Gray5")
            TFPhone.backgroundColor = UIColor(named: "Gray5")
            let image = UIImage(named: "pizza")
            buttonDuzenle.setImage(image, for: .normal)
            TFName.isEnabled = false
            TFSurname.isEnabled = false
            TFSurname.isEnabled = false
            if let name = TFName.text , let surname = TFSurname.text , let phone = TFPhone.text{
                userPagePresenterObject?.updateUserInfo(user_Name: name, user_Surname: surname, user_Phone: phone)
            }
            
            
            
            
           
        }
    }
    
    
    
    
    
    
    
    @IBAction func buttonLogout(_ sender: Any) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        let controller = storyboard?.instantiateViewController(withIdentifier: "welcomePage") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true, completion: nil)
   
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
    }
    
 

}

extension UserPageVC : PresenterToViewUserPageProtocol{
    func favListToView(favFoodList: [Foods]) {
        self.favFoodsList = favFoodList
        
        DispatchQueue.main.async {
            self.favFoodsCollectionView.reloadData()
        }
    }
    
  
    
    func imageToView(user_Image: UIImage) {
        
        self.avatarImageView.image = user_Image
        
    }
    
    func dataToView(user_Name: String, user_Surname: String, user_Phone: String) {
        self.TFName.text = user_Name
        self.TFSurname.text = user_Surname
        self.TFPhone.text = user_Phone
        userPagePresenterObject?.getUserImageFromFireBase()
      
    }
    
   
}

extension UserPageVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favFoodsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let url = "http://kasimadalan.pe.hu/yemekler/resimler/"
        let favFood = favFoodsList[indexPath.row]
        let cell = favFoodsCollectionView.dequeueReusableCell(withReuseIdentifier: "UserPageCollectionViewCell", for: indexPath) as! UserPageCollectionViewCell
        
        if let url = URL(string: "\(url)\(favFood.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                cell.imageFood.kf.setImage(with : url)
            }
            
        }
        cell.labelFoodName.text = favFood.yemek_adi
        cell.delegate = self
        cell.indexPath = indexPath
        
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
         
         
        let hucreGenisligi = favFoodsCollectionView.bounds.width-20
         tasarim.itemSize = CGSize(width: hucreGenisligi, height: 70)
        
        favFoodsCollectionView.collectionViewLayout = tasarim
    }
}
extension UserPageVC : FavFoodUserPage{
    func favFood(indexPath: IndexPath) {
        userPagePresenterObject?.deleteFoodFromFavList(yemek_adi: favFoodsList[indexPath.row].yemek_adi!)
        
    }
    
    
}
