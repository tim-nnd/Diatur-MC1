//
//  NewTaskControllerViewController.swift
//  Diatur-MC1
//
//  Created by Dian Dinihari on 07/04/21.
//

import UIKit

class NewTaskVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var priority: UIPickerView!
    @IBOutlet weak var note: UITextView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var pickerData: [String] = ["High", "Medium", "Low"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.priority.delegate = self
        self.priority.dataSource = self
        
        /* Call this to edit the task */
        editData()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var title = UILabel()
        if let view = view {
            title = view as! UILabel
        }
        title.font = UIFont.systemFont(ofSize: 17)
        title.text = pickerData[row]
        title.textColor = UIColor.systemBlue
        title.textAlignment = .center
        
        return title
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        _ = dateFormatter.string(from: datePicker.date)
    }
    
    func editData() {
        let noteData = "Some some some Note"
        let taskNameData = "Task A"
        let priorityData = 1
        let dateData = "2021-04-20"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateObj = dateFormatter.date(from: dateData)
        
        note.text = noteData
        taskName.text = taskNameData
        priority.selectRow(priorityData, inComponent: 0, animated: true)
        datePicker.date = dateObj!
        navBar.title = "Edit"
    }
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
