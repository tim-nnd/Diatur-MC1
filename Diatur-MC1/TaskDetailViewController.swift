//
//  ViewController.swift
//  Diatur-MC1
//
//  Created by Daffa Satria on 08/04/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var nameTask: UILabel!
    
    @IBOutlet weak var priorityTask: UILabel!
    
    @IBOutlet weak var dateTask: UILabel!
    
    @IBOutlet weak var notesTask: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func NavBackBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func startBtn(_ sender: UIButton) {
        LabelChange()
    }
    
    
    func LabelChange(){
        nameTask.text = "Ini nama Task"
        priorityTask.text = "Medium Priority"
        dateTask.text = "8 April 2021"
        notesTask.text = "asbasbanwpienfio3930jnipvkn3oefjlndc owienoi23ncpiprknvoiwenfowejnfowienwepfwnefpiwekfnewifnkwfowknfdlfknweoflwenfpwfneojlnrpwiknwepfnpfiknweefpwikfnwepfknwfpekfnwpfknfpweifknwepfwnkefpkwenfewpin INI TEST GANTI DOANG"
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
