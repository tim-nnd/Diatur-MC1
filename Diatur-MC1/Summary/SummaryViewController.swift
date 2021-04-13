//
//  SummaryViewController.swift
//  Diatur-MC1
//
//  Created by Timothy Ananda on 08/04/21.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var taskList: UITableView!
    
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var workHourLabel: UILabel!
    @IBOutlet weak var lifeHourLabel: UILabel!
    
    var sortedData: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taskList.delegate = self
        taskList.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getSortedData()
        self.taskList.reloadData()
    }
    
    func getSortedData() {
        sortedData = TaskDatabase.taskArray.sorted(by: {$0.priority < $1.priority})
    }

    @IBAction func datePickerChanged(_ sender: Any) {
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

extension SummaryViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteButtonAction = UIContextualAction(style: .destructive, title: "", handler: {(action, deleteView, onComplete) in
            
            var deleteIndex = 0
            for n in 0...(TaskDatabase.taskArray.count-1) {
                
                if TaskDatabase.taskArray[n].name == self.sortedData[indexPath.row].name && TaskDatabase.taskArray[n].priority == self.sortedData[indexPath.row].priority {
                    deleteIndex = n
                }
            }
            
            TaskDatabase.taskArray.remove(at: deleteIndex)
            
            self.getSortedData()
            
            self.taskList.deleteRows(at: [indexPath], with: .left)
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
