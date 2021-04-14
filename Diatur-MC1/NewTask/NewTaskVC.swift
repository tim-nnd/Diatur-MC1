//
//  NewTaskControllerViewController.swift
//  Diatur-MC1
//
//  Created by Dian Dinihari on 07/04/21.
//

import UIKit

class NewTaskVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate: NewTaskDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var priority: UIPickerView!
    @IBOutlet weak var note: UITextView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var pickerData: [String] = ["High", "Medium", "Low"]
    
    var parameterEdit: Int = 0
    
//    var taskNameData = ""
    var priorityData = 0
//    var dateData = Date()
//    var noteData = ""
    
    var taskToBeEdited: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(parameterEdit)
        
        self.priority.delegate = self
        self.priority.dataSource = self
        
        if parameterEdit == 1 {
            editData()
        }
       
        
    }
    
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        parameterEdit = 0
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
        priorityData = row
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
//        let dateFormatter = DateFormatter()
//
//        dateFormatter.dateStyle = DateFormatter.Style.long
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//
//        _ = dateFormatter.string(from: datePicker.date)
        
//        dateData = datePicker.date
    }
    
    func editData() {
        
        taskName.text = taskToBeEdited?.name
        priority.selectRow(taskToBeEdited?.priority ?? 0, inComponent: 0, animated: true)
        datePicker.date = taskToBeEdited?.date ?? Date()
        note.text = taskToBeEdited?.notes
        
        navBar.title = "Edit"
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
        switch parameterEdit {
        case 1:
            taskToBeEdited?.name = taskName.text ?? "Untitled Task"
            taskToBeEdited?.priority = priorityData
            taskToBeEdited?.date = datePicker.date
            taskToBeEdited?.notes = note.text
        default:
            TaskDatabase.taskArray.append(Task(name: taskName.text ?? "Untitled Task", priority: priorityData, date: datePicker.date, notes: note.text))
        }
        
        delegate?.taskAdded()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
