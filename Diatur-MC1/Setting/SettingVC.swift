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
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: Any){
        
      
        
        if segue.identifier == "settingDetailWork" {
            if let vc = storyboard?.instantiateViewController(withIdentifier : "settingDetailWork") as? SettingDetailViewController {
                navigationController?.pushViewController(vc, animated : true)
            }
        }
        else if segue.identifier == "firstSetupBreak" {
            if let vc = storyboard?.instantiateViewController(withIdentifier : "firstSetupBreak") as? SettingDetailBreakViewController {
                navigationController?.pushViewController(vc, animated : true)
            }
        }
        
        
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
        
        settingList.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            if let vc = self.storyboard?.instantiateViewController(withIdentifier : "settingDetailWork") as? SettingDetailViewController {
                
                present(vc, animated: true, completion: nil)
                
            }
            
        case 1:
            
            if let vc = self.storyboard?.instantiateViewController(withIdentifier : "firstSetupBreak") as? SettingDetailBreakViewController {
                present(vc, animated: true, completion: nil)
                
            }
            
        default:
            break;
        }
    }
}

