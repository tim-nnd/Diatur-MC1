//
//  ViewController.swift
//  Diatur-MC1
//
//  Created by Daffa Satria on 08/04/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var nameTask: UILabel!
    
    @IBOutlet weak var priorityLabel: UILabel!
    
    @IBOutlet weak var pirorityImage: UIImageView!
    
    @IBOutlet weak var dateTask: UILabel!
    
    @IBOutlet weak var notesTask: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var stopwatch_Counter: UILabel!
    
    @IBOutlet weak var breakBtn: UIButton!
    
    @IBOutlet weak var finishBtn: UIButton!
    
    @IBOutlet weak var workBtn: UIButton!
    
    // Dapet Value dari Overview (Dummy)
    
    var titleLabel: String = ""
    var prorityLabelIndicator: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTask.text = titleLabel
        
        
        switch prorityLabelIndicator {
        
        case 0:
            pirorityImage.tintColor = #colorLiteral(red: 0.9255061746, green: 0.3098220527, blue: 0.2627460957, alpha: 1)
            priorityLabel.text = "High Priority"
            
        case 1:
            pirorityImage.tintColor = #colorLiteral(red: 0.976410687, green: 0.8706294894, blue: 0.3489934802, alpha: 1)
            priorityLabel.text = "Medium Priority"
            
        case 2:
            pirorityImage.tintColor = #colorLiteral(red: 0.6469622254, green: 0.7765128613, blue: 0.694031775, alpha: 1)
            priorityLabel.text = "Low Priority"
            
        default:
           return
            
        }
        // Do any additional setup after loading the view.
    }
    
  
    
    @IBAction func startBtnOnTapped(_ sender: UIButton) {
//      Hiding a StartBtn, Showing stopwatch_Counter on startBtn Click
        ShowStopwatch()
        HideStartBtn()
        ShowBreakBtn()
        ShowFinishBtn()
    }
    
    @IBAction func breakBtnOnTapped(_ sender: UIButton) {
        ShowWorkBtn()
        HideBreakBtn()
    }
    
    @IBAction func finishBtnOnTapped(_ sender: UIButton) {
        //confirmation finish
        let alert = UIAlertController (title: "Finish Task Confirmation", message: "are you sure you want to finish current task?", preferredStyle: .alert)
        //finish Timer
      
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(_)in
            
            if let nav = self.navigationController{
                nav.popViewController(animated: true)
            }
                
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func workBtnOnTapped(_ sender: UIButton) {
        ShowBreakBtn()
        HideWorkBtn()
    }
    
    
    func ShowStopwatch (){
//      Showing stopwatch Label
        if (stopwatch_Counter.isHidden == true){
            stopwatch_Counter.isHidden = false
        
        }
    }
    
    func HideStartBtn(){
//      hiding StartBtn
        if (startBtn.isHidden == false){
            startBtn.isHidden = true
        }
    }
    
    func ShowBreakBtn(){
//      showing breakBtn
        if (breakBtn.isHidden == true){
            breakBtn.isHidden = false
        }
    }
    
    func HideBreakBtn(){
//      hide breakBtn
        if (breakBtn.isHidden == false){
            breakBtn.isHidden = true
        }
    }
    
    func ShowWorkBtn(){
//      showing workBtn
        if (workBtn.isHidden == true){
            workBtn.isHidden = false
        }
    }
    
    func HideWorkBtn(){
//        hideWorkBtn
        if (workBtn.isHidden == false) {
            workBtn.isHidden = true
        }
    }
    
    func ShowFinishBtn(){
//        show finishBtn
        if (finishBtn.isHidden == true){
            finishBtn.isHidden = false
        }
    }
    
    func HideFinishBt() {
//        hide finishBtn
        if (finishBtn.isHidden == false){
            
        }
        
    }
//
//  Stopwatch
//  [counting up timer]
//
    
    
    var timerUp: Timer = Timer()
    var count: Int = 0
    var countStatus:Bool = false

    
    func timerFinish() {
        if (countStatus == true)
        {
            countStatus = false
            timerUp.invalidate()
            
            HideBreakBtn()
            HideWorkBtn()
    }
    func timerOn(){
        if (countStatus == false)
        {
            countStatus = true
            //timerUp = Timer.scheduledTimer(timeInterval: 1, target: self, selector: timerCounter(), userInfo: nil, repeats: true)
        }
        
    }
    
        func timerCounter() -> Void
        {
            count = count + 1
        }
        
        func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
        {
            return ((seconds / 3600), ((seconds % 3600)/60),((seconds % 3600) % 60))
        }
    }
    /*func LabelChange(){
        nameTask.text = "Ini nama Task"
        priorityTask.text = "Medium Priority"
        dateTask.text = "8 April 2021"
        notesTask.text = "asbasbanwpienfio3930jnipvkn3oefjlndc owienoi23ncpiprknvoiwenfowejnfowienwepfwnefpiwekfnewifnkwfowknfdlfknweoflwenfpwfneojlnrpwiknwepfnpfiknweefpwikfnwepfknwfpekfnwpfknfpweifknwepfwnkefpkwenfewpin INI TEST GANTI DOANG"
    }*/
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    }
