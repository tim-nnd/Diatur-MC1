//
//  ScrollViewTestingViewController.swift
//  Diatur-MC1
//
//  Created by Azka Kusuma on 13/04/21.
//

import UIKit

class ScrollViewTestingViewController: UIViewController {

    
    let circle = CAShapeLayer()
    let strokeCircle = CAShapeLayer()
    
    var position: Double = 0
    
    @IBOutlet weak var circleView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let centre = CGPoint(x: circleView.frame.width/2, y: circleView.frame.height/2)
        
        let circlePath = UIBezierPath(arcCenter: centre , radius: 100, startAngle:  -CGFloat.pi / 2, endAngle: 1.5*CGFloat.pi, clockwise: true)
        
        
        // Stroke yang jadi "jalur"nya
        strokeCircle.path = circlePath.cgPath
        
        
        strokeCircle.fillColor = UIColor.clear.cgColor
        strokeCircle.strokeColor = #colorLiteral(red: 0.7998943329, green: 0.9216216803, blue: 0.976352036, alpha: 1)
        
        strokeCircle.lineWidth = 28
        
        circleView.layer.addSublayer(strokeCircle)
        
        //Stroke Fill
        
        circle.path = circlePath.cgPath
        
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = #colorLiteral(red: 0.1566299498, green: 0.5098516345, blue: 0.976349175, alpha: 1)
        circleView.layer.addSublayer(circle)
        
        circle.lineWidth = 28
        circle.strokeEnd = 0
        
        circle.lineCap = .round
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func userSwipe(_ sender: UISwipeGestureRecognizer) {
        print("userRight")
        var fromValues = position
        
        strokeCircle.strokeColor = #colorLiteral(red: 0.7998943329, green: 0.9216216803, blue: 0.976352036, alpha: 1)
        circle.strokeColor = #colorLiteral(red: 0.1566299498, green: 0.5098516345, blue: 0.976349175, alpha: 1)
        
        let animateCircle = CABasicAnimation(keyPath: "strokeEnd")
        
        // Fillnya nambah, gak dari 0 lagi
        position += 0.125
       
        
        
        animateCircle.fromValue = fromValues
        animateCircle.toValue = position
        
        
        // Masalah Bug disini
        //circle.strokeEnd = CGFloat(position)
        //
        animateCircle.duration = 1
        
        circle.strokeEnd = CGFloat(position)
        
        circle.add(animateCircle, forKey: "Bebas")
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        print("userLeft")
        
        let centre = CGPoint(x: circleView.frame.width/2, y: circleView.frame.height/2)
        
        let circlePath = UIBezierPath(arcCenter: centre , radius: 100, startAngle:  -CGFloat.pi / 2, endAngle: 1.5*CGFloat.pi, clockwise: true)
        
        
        // Stroke yang jadi "jalur"nya
        strokeCircle.path = circlePath.cgPath
        
        
        strokeCircle.fillColor = UIColor.clear.cgColor
        strokeCircle.strokeColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        strokeCircle.lineWidth = 28
        
        circleView.layer.addSublayer(strokeCircle)
        
        //Stroke Fill
        
        circle.path = circlePath.cgPath
        
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = #colorLiteral(red: 0.976410687, green: 0.8706294894, blue: 0.3489934802, alpha: 1)
        circleView.layer.addSublayer(circle)
        
        circle.lineWidth = 28
        circle.strokeEnd = 0
        
        circle.lineCap = .round
        
        var fromValues = position
        
        let animateCircle = CABasicAnimation(keyPath: "strokeEnd")
        
        // Fillnya nambah, gak dari 0 lagi
       
        animateCircle.fromValue = fromValues
        animateCircle.toValue = 1
        
        
        // Masalah Bug disini
        //circle.strokeEnd = CGFloat(position)
        //
        animateCircle.duration = 1
        
        circle.strokeEnd = 1
        
        circle.add(animateCircle, forKey: "Bebas")
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
