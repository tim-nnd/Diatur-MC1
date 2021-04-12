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
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var stopwatch_Counter: UILabel!
    
    @IBOutlet weak var breakBtn: UIButton!
    
    @IBOutlet weak var finishBtn: UIButton!
    
    @IBOutlet weak var workBtn: UIButton!
    
    @IBOutlet weak var frameTimer: UIImageView!
    
    @IBOutlet weak var timerTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func NavBackBtnOnTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func startBtnOnTapped(_ sender: UIButton) {
//      Hiding a StartBtn, Showing stopwatch_Counter on startBtn Click
        ShowStopwatch()
        HideStartBtn()
        timerOn()
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
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: {(_)in
            
            //do Show time used
        }))
        
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {(_)in
        self.timerFinish()
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func workBtnOnTapped(_ sender: UIButton) {
        ShowBreakBtn()
        HideWorkBtn()
    }
    
    
    func ShowStopwatch (){
//      Showing stopwatch Label, Frame, & Title
        if (stopwatch_Counter.isHidden == true && frameTimer.isHidden == true && timerTitle.isHidden == true){
            stopwatch_Counter.isHidden = false
            frameTimer.isHidden = false
            timerTitle.isHidden = false
            self.timerOn()
        
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

//  STOPWATCH
//  [counting up timer]

    
    
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
    }
    func timerOn(){
        if (countStatus == false)
        {
            countStatus = true
            timerUp = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
        
    }
    
       @objc func timerCounter() -> Void
        {
            count = count + 1
            let time = secondsToHoursMinutesSeconds(seconds: count)
        let counterTimeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        stopwatch_Counter.text = counterTimeString
        }
        
        func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
        {
            return ((seconds / 3600), ((seconds % 3600)/60),((seconds % 3600) % 60))
        }
    
    func makeTimeString (hours: Int, minutes: Int, seconds: Int) -> String{
        var counterTimeString = ""
        counterTimeString += String(format: "%02d", hours)
        counterTimeString += " : "
        counterTimeString += String(format: "%02d", minutes)
        counterTimeString += " : "
        counterTimeString += String(format: "%02d", seconds)
        return counterTimeString
    }
 /*
    func LabelChange(){
        nameTask.text = "Ini nama Task"
        priorityTask.text = "Medium Priority"
        dateTask.text = "8 April 2021"
        notesTask.text = "Ini contoh cobain data dummy, belom pake data asli yang dari new task, INI TEST GANTI DOANG"
    }
    */
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    }
