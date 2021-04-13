//
//  SettingDetailViewController.swift
//  Diatur-MC1
//
//  Created by Komang Aryadinata on 09/04/21.
//

import UIKit

class SettingDetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerViewWorkHourSetting: UIPickerView!
    
    let arrayDataWorkHourSetting = ["1", "2","3","4","5","6","7","8","9","10","11","12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewWorkHourSetting.dataSource = self
        pickerViewWorkHourSetting.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayDataWorkHourSetting.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayDataWorkHourSetting[row]
    }

    @IBAction func doneButton(_ sender: UIButton) {
    }
}
