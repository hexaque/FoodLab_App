//
//  UrunlerCell.swift
//  FoodLab_App
//
//  Created by Que on 15.10.2022.
//

import UIKit

class UrunlerCell: UITableViewCell {

    @IBOutlet weak var labelFoodPrice: UILabel!
    @IBOutlet weak var labelFoodName: UILabel!
    @IBOutlet weak var imageFood: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
