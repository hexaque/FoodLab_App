//
//  Extension.swift
//  FoodLab_App
//
//  Created by Que on 14.10.2022.
//

import UIKit
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
   
    
    @IBInspectable var borderWidth: CGFloat {
          set {
              layer.borderWidth = newValue
          }
          get {
              return layer.borderWidth
          }
      }
    
   
        @IBInspectable var borderColor: UIColor? {
            set {
                layer.borderColor = newValue?.cgColor
            }
            get {
                guard let color = layer.borderColor else {
                    return nil
                }
                return UIColor(cgColor: color)
            }
        }
    
}
