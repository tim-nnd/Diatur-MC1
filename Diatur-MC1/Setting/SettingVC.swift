//
//  SettingVC.swift
//  Diatur-MC1
//
//  Created by Dian Dinihari on 10/04/21.
//

import UIKit

class SettingVC: UIViewController {
    
    
    @IBOutlet weak var settingList: UITableView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    let Settings = ["Work-Rest-Play", "Mini Breaks"]
    let SettingsImage = ["slider.vertical.3", "headphones"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingList.delegate = self
        settingList.dataSource = self
    }
    @IBAction func backButtonPress(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension SettingVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        
        let setting = Settings[indexPath.row]
        let settingImage = SettingsImage[indexPath.row]
        
        cell.textLabel?.text = setting
        cell.imageView?.image = UIImage(systemName: settingImage)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            identifier:"settingDetailWork";
        case 1:
            identifier:"firstSetupBreak";
        default:
            break;
            
        }
        
    }
    
    
}
