//
//  FirstSetupViewController.swift
//  Diatur-MC1
//
//  Created by Komang Aryadinata on 08/04/21.
//

import UIKit

let dataWorkHour = ["1", "24"]

class FirstSetupViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerViewWorkHour: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataWorkHour.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewWorkHour.dataSource = self
        pickerViewWorkHour.delegate = self
    }
}
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataWorkHour[row]
    }
}
