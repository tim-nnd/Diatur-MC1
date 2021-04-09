//
//  FirstSetupViewController.swift
//  Diatur-MC1
//
//  Created by Komang Aryadinata on 08/04/21.
//

import UIKit

let arrayDataWorkHour = ["1", "2","3","4","5","6","7","8","9","10","11","12"]

class FirstSetupViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pickerViewWorkHour: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewWorkHour.dataSource = self
        pickerViewWorkHour.delegate = self
    }
}

extension FirstSetupViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayDataWorkHour.count
    }
}

extension FirstSetupViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayDataWorkHour[row]
    }
}
