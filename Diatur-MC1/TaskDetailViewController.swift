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
    
    @IBOutlet weak var breakLabel: UILabel!
    
    @IBOutlet weak var timer_Counter: UILabel!
    
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
        timerUpOn()
        ShowBreakBtn()
        ShowFinishBtn()
    }
    
    @IBAction func breakBtnOnTapped(_ sender: UIButton) {
        ShowWorkBtn()
        ShowTimer()
        timerUpOn()
        HideBreakBtn()
        breakLabel.isHidden = false
        isBreakTimerActive = true
    }
    
    @IBAction func finishBtnOnTapped(_ sender: UIButton) {
        //confirmation finish
        let alert = UIAlertController (title: "Finish Task Confirmation", message: "are you sure you want to finish current task?", preferredStyle: .alert)
        //finish Timer
        alert.addAction(UIAlertAction(title: "CANCEL", style: .destructive, handler: {(_)in
            
            //result: show time used
        }))
        
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {(_)in
            self.timerUpFinish()
            self.HideFinishBtn()
            self.HideTimer()
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func workBtnOnTapped(_ sender: UIButton) {
        ShowBreakBtn()
        timerDownReset()
        HideWorkBtn()
        breakLabel.isHidden = true
        timer_Counter.isHidden = true
    }
    
    
    func ShowStopwatch (){
        //      Showing stopwatch Label, Frame, & Title
        if (stopwatch_Counter.isHidden == true && frameTimer.isHidden == true && timerTitle.isHidden == true){
            stopwatch_Counter.isHidden = false
            frameTimer.isHidden = false
            timerTitle.isHidden = false
            self.timerUpOn()
            
        }
    }
    
    
    func ShowTimer()
    {
        //timer_Counter.isHidden.toggle()
        //    showing countdown timer counter
        if timer_Counter.isHidden == true {
            timer_Counter.isHidden = false
        }
    }
    func HideTimer() {
        //    hide countdown timer counter
        if timer_Counter.isHidden == false {
            timer_Counter.isHidden = true
            breakLabel.isHidden = true
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
    
    func HideFinishBtn() {
        //        hide finishBtn
        if (finishBtn.isHidden == false){
            finishBtn.isHidden = true
            
        }
        
    }
    
    //  STOPWATCH & TIMER
    //  [counting up timer]
    
    var mainTimer: Timer = Timer()
    var timeCounter: Int = 0
    var isStopwatchActive:Bool = false
    var breakTimeRemaining = 301
    var isBreakTimerActive = false
//    var breakTimer: Timer = Timer()
    
    
    func timerUpFinish() {
        if (isStopwatchActive)
        {
            isStopwatchActive = false
            mainTimer.invalidate()
            HideBreakBtn()
            HideWorkBtn()
        }
    }
    func timerUpOn(){
        if (isStopwatchActive == false)
        {
            isStopwatchActive = true
            mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func timerCounter() -> Void
    {
        timeCounter = timeCounter + 1
        let time = secondsToHoursMinutesSeconds(seconds: timeCounter)
        let counterTimeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        stopwatch_Counter.text = counterTimeString
        
        if isBreakTimerActive {
            if breakTimeRemaining > 0{
                breakTimeRemaining -= 1
            }
            let timer = secondToMinutesSeconds(seconds: breakTimeRemaining)
            let timerString = maketimerString(minutes: timer.0, seconds: timer.1)
            timer_Counter.text = timerString
        }
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
    
    //    Timer Break
    //    Countdown timer
    //
    
    func timerDownReset()
    {
        if isBreakTimerActive == true{
            breakTimeRemaining = 301
            HideTimer()
        }
    }
    
    func secondToMinutesSeconds (seconds : Int) -> (Int, Int) {
        (((seconds % 3600)/60),((seconds % 3600) % 60))
    }
    
    func maketimerString (minutes: Int, seconds: Int) -> String {
        var timerString = ""
        timerString += String (format: "%02d", minutes)
        timerString += String (" : ")
        timerString += String (format: "%02d", seconds)
        return timerString
    }
    
    func timerDownFinish()
    {
        if isBreakTimerActive == true{
            isBreakTimerActive = false
            mainTimer.invalidate()
            
        }
    }
    
    
    
    /*func timerDownOn()
     {
     if(timerStatus == false)
     {
     Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (downCounter), userInfo: nil, repeats: true)
     timerStatus = true
     }
     }
     */
    
    
    /* @objc func downCounter() -> Void
     {
     if timeRemaining > 0{
     timeRemaining -= 1
     }
     let timer = secondToMinutesSeconds(seconds: timeRemaining)
     let timerString = maketimerString(minutes: timer.0, seconds: timer.1)
     timer_Counter.text = timerString
     
     }*/
    
    
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
