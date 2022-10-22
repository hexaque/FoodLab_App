//
//  FilterPageVC.swift
//  FoodLab_App
//
//  Created by Que on 18.10.2022.
//

import UIKit

class FilterPageVC: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!

    @IBOutlet weak var TFSiralama: UITextField!
    var pickerView =  UIPickerView()
    var siralama = ["Fiyata göre küçükten büyüğe sırala","Fiyata göre büyükten küçüğe sırala"]
    
    var delegate : FilterPageToHomePage?
    
    
    
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround()
        pickerView.dataSource = self
        pickerView.delegate = self
        super.viewDidLoad()
        TFSiralama.inputView = pickerView

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonCancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    @IBAction func sliderDegisim(_ sender: UISlider) {
        sliderLabel.text = String(Int(sender.value))
    }
    @IBAction func buttonFilter(_ sender: Any) {
        if let siralamaText = TFSiralama.text , let filterText = sliderLabel.text{
            print("x")
            delegate?.SendSiralamaAndFilterToHomePage(filter: Int(filterText)!, siralama: siralamaText)
            navigationController?.popViewController(animated: true)

            dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func buttonClear(_ sender: Any) {
        TFSiralama.text = " "
        sliderLabel.text = "100"
        slider.setValue(100, animated: true)
    }
}


extension FilterPageVC : UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return siralama.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return siralama[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        TFSiralama.text = siralama[row]
        TFSiralama.resignFirstResponder()
    }
    
    
}
