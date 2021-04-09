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
    
    var cellID = "listCell"
    var sorted: [Task] = []
    
    
    // Reference dari Task.Swift
    var arrayTask: [Task] = [
    
        Task.init(name: "Ngoding Dulu", priority: 0),
        Task.init(name: "Ahayy Ngoding", priority: 2),
        Task.init(name: "Lagi MC1.2 Brooow", priority: 1),
        Task.init(name: "LAGI UTS NICH", priority: 1)
    ]
   
 
    var priorityLabel = ""
    var colorPriority: UIImage?
    
    // Circle
    let circle = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        
        //Nanya ka octa atau kaben
        let centre = CGPoint(x: circleView.frame.width/2, y: circleView.frame.height/2)
        
        let circlePath = UIBezierPath(arcCenter: centre , radius: 100, startAngle:  -CGFloat.pi / 2, endAngle: 2*CGFloat.pi, clockwise: true)
        
        circle.path = circlePath.cgPath
        
        circle.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        circle.strokeColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        circleView.layer.addSublayer(circle)
        
        
        
        circle.lineWidth = 10.0
        circle.strokeEnd = 0
        
    
       
        ListTask.delegate = self
        ListTask.dataSource = self
        // Do any additional setup after loading the
     
        // Sort array
       sorted = arrayTask.sorted(by: {$0.priority < $1.priority})
   
        
    }
    
    // Testing purposes
    @IBAction func userTap(_ sender: UIGestureRecognizer) {
        print("userTap")
        
        let animateCircle = CABasicAnimation(keyPath: "strokeEnd")
        
        animateCircle.toValue = 1
        animateCircle.duration = 3
        
        //After Animation Complete, it Stays.
        animateCircle.fillMode = .forwards
        animateCircle.isRemovedOnCompletion = false
        
        circle.add(animateCircle, forKey: "Bebas")
        
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

}



