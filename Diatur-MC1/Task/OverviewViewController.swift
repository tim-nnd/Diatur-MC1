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
    @IBOutlet weak var workingLIfe: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var cellID = "listCell"
    var labelWorkHourText = 0
    
    
    var ListViewSorted: [Task] = []
    
    
    var taskToBeEdited: Task?
    
    
    var inputDariFirstTime = 8
    var tableViewParameters: Bool = false
    
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
        
        
        
        workingLIfe.isHidden = true
        lifeLabel.isHidden = true
        
        ListTask.delegate = self
        ListTask.dataSource = self
        
        makeWorkCircle()
        
        arraySort()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        arraySort()
        ListTask.reloadData()
        
    }
    
    @IBAction func userSwipeKanan(_ sender: UISwipeGestureRecognizer) {
        print("userKanan")
        
        workingLIfe.isHidden = true
        lifeLabel.isHidden = true
        hoursLabel.isHidden = false
        workLabel.isHidden = false
        labelWorkHour.isHidden = false
        tableViewParameters = false
        
        pageControl.currentPage = 0
        makeWorkCircle()
        
        ListTask.isUserInteractionEnabled = true
        ListTask.reloadData()
        
    }
    
    @IBAction func userSwipeLeft(_ sender: UISwipeGestureRecognizer) {
        
        print("userKiri")
        workingLIfe.isHidden = false
        lifeLabel.isHidden = false
        hoursLabel.isHidden = true
        workLabel.isHidden = true
        labelWorkHour.isHidden = true
        tableViewParameters = true
        
        
        pageControl.currentPage = 1
        
        
        makeLifeCircle()
        lifeCircleAnimation()
        
        ListTask.isUserInteractionEnabled = false
        ListTask.reloadData()
        
    }
    
    // Testing purposes
    @IBAction func userTap(_ sender: UIGestureRecognizer) {
        print("userTap")
        workCircleAnimation()
        
    }
    
    
    @IBAction func addTask(_ sender: UIButton) {
        
        performSegue(withIdentifier: "addToAdd", sender: self)
        
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        
        
    }
    
    func makeLifeCircle(){
        
        let centre = CGPoint(x: circleView.frame.width/2, y: circleView.frame.height/2)
        
        let circlePath = UIBezierPath(arcCenter: centre , radius: 100, startAngle:  -CGFloat.pi / 2, endAngle: 1.5*CGFloat.pi, clockwise: true)
        
        
        // Stroke yang jadi "jalur"nya
        strokeCircle.path = circlePath.cgPath
        
        
        strokeCircle.fillColor = UIColor.clear.cgColor
        strokeCircle.strokeColor = #colorLiteral(red: 0.9999175668, green: 0.9804440141, blue: 0.839117527, alpha: 1)
        
        strokeCircle.lineWidth = 28
        
        circleView.layer.addSublayer(strokeCircle)
        
        //Stroke Fill
        
        circle.path = circlePath.cgPath
        
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = #colorLiteral(red: 0.9175909162, green: 0.8157240748, blue: 0.08633806556, alpha: 1)
        circleView.layer.addSublayer(circle)
        
        circle.lineWidth = 28
        circle.strokeEnd = 0
        
        circle.lineCap = .round
        
        
    }
    
    func makeWorkCircle(){
        
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
        
        
    }
    
    func lifeCircleAnimation(){
        
        let animateCircle = CABasicAnimation(keyPath: "strokeEnd")
        
        // Fillnya nambah, gak dari 0 lagi
        animateCircle.toValue = 1
        animateCircle.fromValue = 0
        
        animateCircle.duration = 5
        
        circle.strokeEnd = 1
        
        circle.add(animateCircle, forKey: "Bebas")
        
    }
    
    func workCircleAnimation(){
        
        let fromValues = position
        
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
    
    func arraySort(){
        // Get filtered array
        var filteredData: [Task] = []
        
        for task in TaskDatabase.taskArray {
            if Calendar.current.compare(task.date, to: Date(), toGranularity: .day) == .orderedSame && !task.isCompleted {
                filteredData.append(task)
            }
        }
        
        // Sort array
        ListViewSorted = filteredData.sorted(by: {$0.priority < $1.priority})
        
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
        
        if tableViewParameters{
            
            return TipsnTrick.TipsArray.count
        }
        else{
            
            return ListViewSorted.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableViewParameters{
            let cells = ListTask.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! DetailedTaskTableViewCell
            
            //
            cells.taskName.text = TipsnTrick.TipsArray[indexPath.row]
            
            cells.priorityColor.tintColor = .white
            cells.priorityLabel.text = ""
            
            cells.accessoryType = .none
            
            return cells
        }
        else{
            
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
            
            // Delete Selected Index
            var indexDelete = 0
            
            for x in 0 ... (counts - 1) {
                
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
            
            for n in 0...(TaskDatabase.taskArray.count-1) {
                if TaskDatabase.taskArray[n].name == self.ListViewSorted[indexPath.row].name && TaskDatabase.taskArray[n].priority == self.ListViewSorted[indexPath.row].priority {
                    self.taskToBeEdited = TaskDatabase.taskArray[n]
                }
            }
            
            self.performSegue(withIdentifier: "editTask", sender: self)
        })
        
        editButtonAction.image = UIImage(systemName: "pencil")
        
        let config = UISwipeActionsConfiguration(actions: [deleteButtonAction, editButtonAction])
        
        config.performsFirstActionWithFullSwipe = true
        return config
    
    
}

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "editTask"{
        let destinationVC = segue.destination as! NewTaskVC
        destinationVC.parameterEdit = 1
        destinationVC.taskToBeEdited = self.taskToBeEdited
    }
    
    if let destinationVC = segue.destination as? NewTaskVC {
        destinationVC.delegate = self
    }
    
}



}



extension OverviewViewController: NewTaskDelegate {
    func taskAdded() {
        arraySort()
        ListTask.reloadData()
    }
}

