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
    
    // Data dari Table View Cell
    var taskName: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ListTask.delegate = self
        // Do any additional setup after loading the
        
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ListTask.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        return cell
    }
    
    
}
