//
//  FirstSetupBreakViewController.swift
//  Diatur-MC1
//
//  Created by Komang Aryadinata on 08/04/21.
//

import UIKit

class FirstSetupBreakViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var pickerViewBreakMinute: UIPickerView!
    @IBOutlet weak var pickerViewWorkMinute: UIPickerView!
    @IBOutlet weak var nextButtonBreak: UIButton!
    
    let arrayDataBreakMinute = ["5","10","15"]
    let arrayDataWorkMinute = ["15", "30","45","60"]
    
    var breakSelectedRow = 0
    var workSelectedRow = 0
    
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
            return arrayDataBreakMinute.count
        }
        else if pickerView == pickerViewWorkMinute {
            return arrayDataWorkMinute.count
        }
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerViewBreakMinute {
            return arrayDataBreakMinute[row]
        }
        else if pickerView == pickerViewWorkMinute {
            return arrayDataWorkMinute[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerViewBreakMinute {
            breakSelectedRow = row
        }
        else if pickerView == pickerViewWorkMinute {
            workSelectedRow = row
        }
    }
    
    @IBAction func nextButtonBreak(_ sender: UIButton) {
        Setting.breakMinute = Int(arrayDataBreakMinute[breakSelectedRow]) ?? 5
        Setting.workMinute = Int(arrayDataWorkMinute[workSelectedRow]) ?? 15
        
        print(Setting.breakMinute)
        print(Setting.workMinute)
    }
    @IBAction func dontSetButton(_ sender: UIButton) {
    }
    
}

