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
    
    var sortedData: [Task] = []
    
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var workHourLabel: UILabel!
    @IBOutlet weak var lifeHourLabel: UILabel!
    
    var selectedRing: Ring = Ring()
    
    var workHourSelected = 0
    var workCircle = CAShapeLayer()
    var workStrokeCircle = CAShapeLayer()
    
    var lifeHourSelected = 0
    var lifeCircle = CAShapeLayer()
    var lifeStrokeCircle = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taskList.delegate = self
        taskList.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getSortedData()
        self.taskList.reloadData()
        
        updateSummary()
        
        drawCircle()
        animateCircle()
    }
    
    func getSortedData() {
        sortedData = TaskDatabase.taskArray.sorted(by: {$0.priority < $1.priority})
    }
    
    func getRing() {
        selectedRing = RingDatabase.ringArray.first(where: {Calendar.current.compare($0.date, to: datePicker.date, toGranularity: .day) == .orderedSame}) ?? Ring(date: datePicker.date)
        print(selectedRing.workTime)
        print(selectedRing.summaryLifeTime())
    }
    
    func drawCircle() {
        let center = CGPoint(x: circleView.frame.width/2, y: circleView.frame.height/2)
        
//        Work circle
        let workCirclePath = UIBezierPath(arcCenter: center, radius: 80, startAngle: -CGFloat.pi/2, endAngle: 1.5*CGFloat.pi, clockwise: true)
        
//        Jalur work circle
        workStrokeCircle.path = workCirclePath.cgPath
        
        workStrokeCircle.fillColor = UIColor.clear.cgColor
        workStrokeCircle.strokeColor = #colorLiteral(red: 0.7998943329, green: 0.9216216803, blue: 0.976352036, alpha: 1)
        
        workStrokeCircle.lineWidth = 20
        
        circleView.layer.addSublayer(workStrokeCircle)
        
//        Work progress circle
        workCircle.path = workCirclePath.cgPath
        
        workCircle.fillColor = UIColor.clear.cgColor
        workCircle.strokeColor = #colorLiteral(red: 0.1566299498, green: 0.5098516345, blue: 0.976349175, alpha: 1)
        
        workCircle.lineWidth = 24
        workCircle.strokeEnd = 0
        
        workCircle.lineCap = .round
        
        circleView.layer.addSublayer(workCircle)
        
//        Life circle
        let lifeCirclePath = UIBezierPath(arcCenter: center, radius: 54, startAngle: -CGFloat.pi/2, endAngle: 1.5*CGFloat.pi, clockwise: true)
        
//        Jalur life circle
        lifeStrokeCircle.path = lifeCirclePath.cgPath
        
        lifeStrokeCircle.fillColor = UIColor.clear.cgColor
        lifeStrokeCircle.strokeColor = #colorLiteral(red: 0.9618940949, green: 0.9266494513, blue: 0.7409597039, alpha: 1)
        
        lifeStrokeCircle.lineWidth = 24
        
        circleView.layer.addSublayer(lifeStrokeCircle)
        
//        Life progress circle
        lifeCircle.path = lifeCirclePath.cgPath
        
        lifeCircle.fillColor = UIColor.clear.cgColor
        lifeCircle.strokeColor = #colorLiteral(red: 0.9258417487, green: 0.8473936915, blue: 0.3104152381, alpha: 1)
        
        lifeCircle.lineWidth = 20
        lifeCircle.strokeEnd = 0
        
        lifeCircle.lineCap = .round
        
        circleView.layer.addSublayer(lifeCircle)
    }
    
    func animateCircle() {
        let animateWorkCircle = CABasicAnimation(keyPath: "strokeEnd")
        let workStrokeValue: Float = Float(workHourSelected)/Float(Setting.workHour)
        print(workStrokeValue)
        
        animateWorkCircle.fromValue = 0
        animateWorkCircle.toValue = workStrokeValue
        
        animateWorkCircle.duration = 2
        
        workCircle.strokeEnd = CGFloat(workStrokeValue)
        
        workCircle.add(animateWorkCircle, forKey: "workCircleAnimation")
        
        let animateLifeCircle = CABasicAnimation(keyPath: "strokeEnd")
        let lifeStrokeValue: Float = Float(lifeHourSelected)/Float(24-Setting.workHour)
        print(lifeStrokeValue)
        
        animateLifeCircle.fromValue = 0
        animateLifeCircle.toValue = lifeStrokeValue
        
        animateLifeCircle.duration = 2
        
        lifeCircle.strokeEnd = CGFloat(lifeStrokeValue)
        
        lifeCircle.add(animateLifeCircle, forKey: "lifeCircleAnimation")
    }
    
    func updateSummary() {
        getRing()
        
        workHourSelected = selectedRing.workTime
        
        if Calendar.current.compare(selectedRing.date, to: Date(), toGranularity: .day) == .orderedSame {
            lifeHourSelected = selectedRing.todayLifeTime()
        } else if Calendar.current.compare(selectedRing.date, to: Date(), toGranularity: .day) == .orderedAscending {
            lifeHourSelected = selectedRing.summaryLifeTime()
        } else {
            workHourSelected = 0
            lifeHourSelected = 0
        }
        
        workHourLabel.text = "\(workHourSelected)HRS"
        lifeHourLabel.text = "\(lifeHourSelected)HRS"
    }

    @IBAction func datePickerChanged(_ sender: Any) {
        updateSummary()
        animateCircle()
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
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        let deleteButtonAction = UIContextualAction(style: .destructive, title: "", handler: {(action, deleteView, onComplete) in
//
//            var deleteIndex = 0
//            for n in 0...(TaskDatabase.taskArray.count-1) {
//                if TaskDatabase.taskArray[n].name == self.sortedData[indexPath.row].name && TaskDatabase.taskArray[n].priority == self.sortedData[indexPath.row].priority {
//                    deleteIndex = n
//                }
//            }
//
//            TaskDatabase.taskArray.remove(at: deleteIndex)
//
//            self.getSortedData()
//
//            self.taskList.deleteRows(at: [indexPath], with: .left)
//            self.taskList.reloadData()
//            print("Del \(indexPath.row)")
//        })
//
//        deleteButtonAction.image = UIImage(systemName: "trash")
//
//        let editButtonAction = UIContextualAction(style: .normal, title: "", handler: {(actions, editView, onComplete) in
//
//        })
//
//        editButtonAction.image = UIImage(systemName: "pencil")
//
//        let config = UISwipeActionsConfiguration(actions: [deleteButtonAction, editButtonAction])
//
//        config.performsFirstActionWithFullSwipe = true
//        return config
//    }
}
