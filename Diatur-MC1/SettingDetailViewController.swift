//
//  SettingDetailViewController.swift
//  Diatur-MC1
//
//  Created by Komang Aryadinata on 09/04/21.
//

import UIKit

let arrayDataWorkHourSetting = ["1", "2","3","4","5","6","7","8","9","10","11","12"]

class SettingDetailViewController: UIViewController {

    @IBOutlet weak var pickerViewWorkHourSetting: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewWorkHourSetting.dataSource = self
        pickerViewWorkHourSetting.delegate = self
    }
}

extension SettingDetailViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayDataWorkHourSetting.count
    }
}

extension SettingDetailViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayDataWorkHourSetting[row]
    }
}
