//
//  OverviewViewController.swift
//  Diatur-MC1
//
//  Created by Azka Kusuma on 08/04/21.
//

import UIKit

class OverviewViewController: UIViewController {
    
    
    @IBOutlet weak var ListTask: UITableView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var todayListTitle: UILabel!
    
    @IBOutlet weak var labelWorkHour: UILabel!
    
    var cellID = "listCell"
    var labelWorkHourText = 0
    var ListViewSorted: [Task] = []
    
    var inputDariFirstTime = 8
    
    var testingBaru = "Test Coding bareng Azka"
    
    
    var priorityLabel = ""
    var colorPriority: UIImage?
    
    // Circle
    let circle = CAShapeLayer()
    let strokeCircle = CAShapeLayer()
    
    var labelWork = ""
    
    var position: Double = 0
    
    // Leading Trail
    
    var deleteImage = UIImage(systemName: "trash")
    let deleteImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let centre = CGPoint(x: circleView.frame.width/2, y: circleView.frame.height/2)
        
        let circlePath = UIBezierPath(arcCenter: centre , radius: 100, startAngle:  -CGFloat.pi / 2, endAngle: 1.5*CGFloat.pi, clockwise: true)
        
        
        // Stroke yang jadi "jalur"nya
        strokeCircle.path = circlePath.cgPath
        
        
        strokeCircle.fillColor = UIColor.clear.cgColor
        strokeCircle.strokeColor = #colorLiteral(red: 0.7998943329, green: 0.9216216803, blue: 0.976352036, alpha: 1)
        
        strokeCircle.lineWidth = 28
        
        circleView.layer.addSublayer(strokeCircle)
        
        //Stroke Fill
        
        circle.path = circlePath.cgPath
        
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = #colorLiteral(red: 0.1566299498, green: 0.5098516345, blue: 0.976349175, alpha: 1)
        circleView.layer.addSublayer(circle)
        
        circle.lineWidth = 28
        circle.strokeEnd = 0
        
        circle.lineCap = .round
        
        
        ListTask.delegate = self
        ListTask.dataSource = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        arraySort()
        ListTask.reloadData()
        
    }
    
    // Testing purposes
    @IBAction func userTap(_ sender: UIGestureRecognizer) {
        print("userTap")
        var fromValues = position
        
        let animateCircle = CABasicAnimation(keyPath: "strokeEnd")
        
        // Fillnya nambah, gak dari 0 lagi
        position += 0.125
        labelWorkHourText += 1
        
        labelWorkHour.text = "\(labelWorkHourText)/\(inputDariFirstTime)"
        
        
        animateCircle.fromValue = fromValues
        animateCircle.toValue = position
        
        
        // Masalah Bug disini
        //circle.strokeEnd = CGFloat(position)
        //
        animateCircle.duration = 1
        
        circle.strokeEnd = CGFloat(position)
        
        circle.add(animateCircle, forKey: "Bebas")
        
       
        
    }
        

    @IBAction func addTask(_ sender: UIButton) {
        
        performSegue(withIdentifier: "addToAdd", sender: self)
        
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        
        
    }
    
    
    func arraySort(){
        // Sort array
        ListViewSorted = TaskDatabase.taskArray.sorted(by: {$0.priority < $1.priority})
        
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


extension OverviewViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ListViewSorted.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ListTask.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DetailedTaskTableViewCell
        
        let dataDummy = ListViewSorted[indexPath.row]
        
        
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
        
        cell.taskName.text = dataDummy.name
        cell.priorityLabel.text = "Priority \(priorityLabel)"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = storyboard?.instantiateViewController(withIdentifier: "taskDetail") as! TaskDetailViewController
        
        
        cell.titleLabel = ListViewSorted[indexPath.row].name
        cell.prorityLabelIndicator = ListViewSorted[indexPath.row].priority
        
        ListTask.deselectRow(at: indexPath, animated: true)
        
        navigationController?.pushViewController(cell, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let counts = TaskDatabase.taskArray.count
        
        let deleteButtonAction = UIContextualAction(style: .destructive, title: "", handler: { (action, deleteView, onComplete) in
            
            self.ListViewSorted.remove(at: indexPath.row)
            
            // Delete Selected Index
            var indexDelete = 0
            
            for x in 0...counts-1 {
                
                if TaskDatabase.taskArray[x].name == self.ListViewSorted[indexPath.row].name && TaskDatabase.taskArray[x].priority == self.ListViewSorted[indexPath.row].priority{
                    
                    
                    indexDelete = x
                    print(indexDelete, x)
                }
            }
            
            
            TaskDatabase.taskArray.remove(at: indexDelete)
            
            self.arraySort()
            
            self.ListTask.deleteRows(at: [indexPath], with: .left)
            self.ListTask.reloadData()
            print("Delete")
            
        })
        
        deleteButtonAction.image = deleteImage
        
        let editButtonAction = UIContextualAction(style: .normal, title: "", handler: { (actions, editView, onComplete) in
            print("edit")
        })
        
        editButtonAction.image = UIImage(systemName: "pencil")
        
        let config = UISwipeActionsConfiguration(actions: [deleteButtonAction, editButtonAction])
        
        config.performsFirstActionWithFullSwipe = true
        return config
        
        
    }
    
    
    
    
}



