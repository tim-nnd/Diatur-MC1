//
//  OverviewViewController.swift
//  Diatur-MC1
//
//  Created by Azka Kusuma on 08/04/21.
//

import UIKit

class OverviewViewController: UIViewController {
    
    
    @IBOutlet weak var ListTask: UITableView!
    
    @IBOutlet weak var todayListTitle: UILabel!
    
    var cellID = "listCell"
    
    var sorted: [Any]?
    
    // Data Dummy
    
    var arrayDataDummy: [dummyData] = [
        dummyData(nameTask: "Ngoding Dulu ahaayy", priority: 0),
        dummyData(nameTask: "Ahayy Ngoding braay", priority: 2),
        dummyData(nameTask: "Lagi MC1.2 Brooww", priority: 1)
        
    ]
    
    
        
      
    
    var priorityLabel = ""
    var colorPriority: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListTask.delegate = self
        ListTask.dataSource = self
        // Do any additional setup after loading the
     
        // Sort array
         sorted = arrayDataDummy.sorted(by: {$0.priority < $1.priority})
        
        
    }
    
    @IBAction func addTask(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    struct dummyData{
        var nameTask : String
        var priority: Int
        
    }
    
    
}

extension OverviewViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
            
            return sorted!.count
        }
    
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
            
            let cell = ListTask.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DetailedTaskTableViewCell
            
            let dataDummy = arrayDataDummy[indexPath.row]
            
            
            switch dataDummy.priority {
            case 0:
                priorityLabel = "High"
                cell.priorityColor.tintColor = #colorLiteral(red: 0.9255061746, green: 0.3098220527, blue: 0.2627460957, alpha: 1)
                
            case 1:
                priorityLabel = "Medium"
                cell.priorityColor.tintColor = #colorLiteral(red: 0.976410687, green: 0.8706294894, blue: 0.3489934802, alpha: 1)
            case 2:
                priorityLabel = "Low"
                cell.priorityColor.tintColor = #colorLiteral(red: 0.6469622254, green: 0.7765128613, blue: 0.694031775, alpha: 1)
            default:
                priorityLabel = ""
            }
            
            cell.taskName.text = dataDummy.nameTask
            cell.priorityLabel.text = "Priority \(priorityLabel)"
            
            
            return cell
        }

}



