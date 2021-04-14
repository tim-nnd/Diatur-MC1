//
//  FirstSetupViewController.swift
//  Diatur-MC1
//
//  Created by Komang Aryadinata on 08/04/21.
//

import UIKit

class FirstSetupViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pickerViewWorkHour: UIPickerView!
    
    let arrayDataWorkHour = ["1", "2","3","4","5","6","7","8","9","10","11","12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewWorkHour.dataSource = self
        pickerViewWorkHour.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayDataWorkHour.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayDataWorkHour[row]
    }

    @IBAction func nextButton(_ sender: UIButton) {
        
    }
}
