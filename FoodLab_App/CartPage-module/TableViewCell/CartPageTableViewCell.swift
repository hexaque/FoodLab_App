//
//  CartPageTableViewCell.swift
//  FoodLab_App
//
//  Created by Que on 18.10.2022.
//

import UIKit

class CartPageTableViewCell: UITableViewCell {
    @IBOutlet weak var labelAdet: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageFood: UIImageView!
    
    
    
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
