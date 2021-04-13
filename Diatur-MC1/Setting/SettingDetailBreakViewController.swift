//
//  SettingDetailBreakViewController.swift
//  Diatur-MC1
//
//  Created by Komang Aryadinata on 09/04/21.
//

import UIKit

class SettingDetailBreakViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var pickerViewBreakMinute: UIPickerView!
    @IBOutlet weak var pickerViewWorkMinute: UIPickerView!
    
    let arrayDataBreakMinuteSetting = ["5","10","15"]
    let arrayDataWorkMinuteSetting = ["15", "30","45","60"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewBreakMinute.dataSource = self
        pickerViewBreakMinute.delegate = self
        
        pickerViewWorkMinute.dataSource = self
        pickerViewWorkMinute.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerViewBreakMinute {
            return arrayDataBreakMinuteSetting.count
        }
        else if pickerView == pickerViewWorkMinute {
            return arrayDataWorkMinuteSetting.count
        }
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerViewBreakMinute {
            return arrayDataBreakMinuteSetting[row]
        }
        else if pickerView == pickerViewWorkMinute {
            return arrayDataWorkMinuteSetting[row]
        }
        return ""
    }
    @IBAction func doneButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
