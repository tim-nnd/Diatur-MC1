//
//  FirstSetupBreakViewController.swift
//  Diatur-MC1
//
//  Created by Komang Aryadinata on 08/04/21.
//

import UIKit

let arrayDataBreakMinute = ["5","10","15","20"]
let arrayDataWorkMinute = ["15", "30","45","60"]

class FirstSetupBreakViewController: UIViewController {
    @IBOutlet weak var pickerViewBreakMinute: UIPickerView!
    @IBOutlet weak var pickerViewWorkMinute: UIPickerView!
    @IBOutlet weak var nextButtonBreak: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewBreakMinute.dataSource = self
        pickerViewBreakMinute.delegate = self
        
        pickerViewWorkMinute.dataSource = self
        pickerViewWorkMinute.delegate = self
    }
}

extension FirstSetupBreakViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerViewBreakMinute {
            return arrayDataBreakMinute.count
        }
        else if pickerView == pickerViewWorkMinute {
            return arrayDataWorkMinute.count
        }
        return 1
    }
}
extension FirstSetupBreakViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerViewBreakMinute {
            return arrayDataBreakMinute[row]
        }
        else if pickerView == pickerViewWorkMinute {
            return arrayDataWorkMinute[row]
        }
        return ""
    }
}

