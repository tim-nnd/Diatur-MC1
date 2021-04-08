//
//  TaskDetailViewController.swift
//  Diatur-MC1
//
//  Created by Daffa Satria on 07/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var taskName: UILabel!
    
    @IBOutlet weak var priorityLevel: UILabel!
    
    @IBOutlet weak var iconPriority: UIImageView!
    
    @IBOutlet weak var dateTask: UILabel!
    
    @IBOutlet weak var noteTask: UILabel!
    
    @IBOutlet var starBtn: [UIImageView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func NavBackBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func startBtn(_ sender:UIImageView){
        
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
