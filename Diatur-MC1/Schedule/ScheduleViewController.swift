//
//  ScheduleViewController.swift
//  Diatur-MC1
//
//  Created by Timothy Ananda on 08/04/21.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var taskList: UITableView!
    
    var sortedData: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taskList.delegate = self
        taskList.dataSource = self
    }
    
    /*
     buat refresh table tiap balik page
     untuk case jika user melakukan delete di page lain
     */
    override func viewDidAppear(_ animated: Bool) {
        getSortedData()
        self.taskList.reloadData()
    }
    
    @IBAction func addButtonTouch(_ sender: UIButton) {
        
    }
    
    /*
     buat ambil data yg udh kesort dan udh kefilter dari database
     data yg di database ga kesort dan ga kefilter hari
     (logic filter hari masih belom)
     */
    func getSortedData() {
        var filteredData: [Task] = []
        
        for task in TaskDatabase.taskArray {
            if Calendar.current.compare(task.date, to: datePicker.date, toGranularity: .day) == .orderedSame && !task.isCompleted {
                filteredData.append(task)
            }
        }
        
        sortedData = filteredData.sorted(by: {$0.priority < $1.priority})
    }
    
    /*
     buat dapetin hari
     */
    @IBAction func datePickerChanged(_ sender: Any) {
        getSortedData()
        self.taskList.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskList.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! DetailedTaskTableViewCell
        
        let cellData = sortedData[indexPath.row]
        
        cell.taskName.text = cellData.name
        cell.priorityLabel.text = "Priority "
        
        switch cellData.priority {
        case 0:
            cell.priorityLabel.text?.append("High")
            cell.priorityColor.tintColor = #colorLiteral(red: 0.9255061746, green: 0.3098220527, blue: 0.2627460957, alpha: 1)
        case 1:
            cell.priorityLabel.text?.append("Medium")
            cell.priorityColor.tintColor = #colorLiteral(red: 0.976410687, green: 0.8706294894, blue: 0.3489934802, alpha: 1)
        case 2:
            cell.priorityLabel.text?.append("Low")
            cell.priorityColor.tintColor = #colorLiteral(red: 0.6469622254, green: 0.7765128613, blue: 0.694031775, alpha: 1)
        default:
            cell.priorityLabel.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = storyboard?.instantiateViewController(withIdentifier: "taskDetail") as! TaskDetailViewController
        
        cell.titleLabel = sortedData[indexPath.row].name
        cell.prorityLabelIndicator = sortedData[indexPath.row].priority
        
        taskList.deselectRow(at: indexPath, animated: true)
        
        navigationController?.pushViewController(cell, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteButtonAction = UIContextualAction(style: .destructive, title: "", handler: {(action, deleteView, onComplete) in
            
//            cari index yg bakal didelete di array database (karena urutan sorted dengan database beda)
//            *ini prone to unwanted case (case dimana nama dan priority 2 task sama tetapi tanggal beda* (untuk sekarang gk terlalu bermasalah)
            var deleteIndex = 0
            
            for n in 0...(TaskDatabase.taskArray.count-1) {
                if TaskDatabase.taskArray[n].name == self.sortedData[indexPath.row].name && TaskDatabase.taskArray[n].priority == self.sortedData[indexPath.row].priority {
                    deleteIndex = n
                }
            }
            
//            remove task dari database
            TaskDatabase.taskArray.remove(at: deleteIndex)
            
//            refresh ulang array sorted dengan yg database abis didelete
            self.getSortedData()
            
//            refresh tablenya
            self.taskList.reloadData()
            print("Del \(indexPath.row)")
        })
        
        deleteButtonAction.image = UIImage(systemName: "trash")
        
        let editButtonAction = UIContextualAction(style: .normal, title: "", handler: {(actions, editView, onComplete) in
            
        })
        
        editButtonAction.image = UIImage(systemName: "pencil")
        
        let config = UISwipeActionsConfiguration(actions: [deleteButtonAction, editButtonAction])
        
        config.performsFirstActionWithFullSwipe = true
        return config
    }
}
