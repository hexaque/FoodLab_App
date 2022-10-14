//
//  OnboardingCell.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    static let identifier = String(describing: OnboardingCell.self)
    @IBOutlet weak var imageViewSlider: UIImageView!
    
    @IBOutlet weak var titleLabelSlider: UILabel!
    
    @IBOutlet weak var descriptionLabelSlider: UILabel!
    
    func setup(slide:OnboardSlides){
        imageViewSlider.image = slide.image
        titleLabelSlider.text = slide.title
        descriptionLabelSlider.text = slide.desc
    }
}
