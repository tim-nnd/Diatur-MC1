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
    var sorted: [Task] = []
    
    var inputDariFirstTime = 8
    
    
    // Reference dari Task.Swift
    var arrayTask: [Task] = [
        
        Task.init(name: "Ngoding Dulu", priority: 0),
        Task.init(name: "Ahayy Ngoding", priority: 2),
        Task.init(name: "Lagi MC1.2 Brooow", priority: 1),
        Task.init(name: "LAGI UTS NICH", priority: 1)
    ]
    
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
        
        // Sort array
        sorted = arrayTask.sorted(by: {$0.priority < $1.priority})
        
        
    }
    
    // Testing purposes
    @IBAction func userTap(_ sender: UIGestureRecognizer) {
        print("userTap")
        
        animate(complition: {
            self.circle.strokeEnd = CGFloat(self.position)
            print(self.circle.strokeEnd)
        })
        
        
    }
    
    func animate(complition: () -> Void ){
        
        let animateCircle = CABasicAnimation(keyPath: "strokeEnd")
        
        // Fillnya nambah, gak dari 0 lagi
        position += 0.125
        labelWorkHourText += 1
        
        labelWorkHour.text = "\(labelWorkHourText)/\(inputDariFirstTime)"
        
        animateCircle.duration = 3
        animateCircle.toValue = position
        
        // Masalah Bug disini
        //circle.strokeEnd = CGFloat(position)
        //
        
        animateCircle.duration = 3
        
        //After Animation Complete, it Stays.
        animateCircle.fillMode = .forwards
        animateCircle.isRemovedOnCompletion = false
        
        circle.add(animateCircle, forKey: "Bebas")
        // Masih ngebug disini
        complition()
    }
    
    func animation(){
        
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
    
    
}


extension OverviewViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sorted.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ListTask.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DetailedTaskTableViewCell
        
        let dataDummy = sorted[indexPath.row]
        
        
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteButtonAction = UIContextualAction(style: .destructive, title: "", handler: { (action, deleteView, onComplete) in
            
            self.sorted.remove(at: indexPath.row)
            
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



