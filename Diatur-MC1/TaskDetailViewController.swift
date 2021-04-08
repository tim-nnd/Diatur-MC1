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
        ShowBreakBtn()
        ShowFinishBtn()
    }
    
    @IBAction func breakBtnOnTapped(_ sender: UIButton) {
        ShowWorkBtn()
        HideBreakBtn()
    }
    
    @IBAction func finishBtnOnTapped(_ sender: UIButton) {
        
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
