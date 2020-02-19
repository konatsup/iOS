//
//  ViewController.swift
//  TapNumber
//
//  Created by konatsu_p on 2020/02/19.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    var timer: Timer = Timer()
    
    var numArray: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    var buttonArray: [UIButton] = []
    var index: Int = 0
    var score: Int = 0
    var timerCount: Double = 0.0
    
    let buttonWidth: Double = 60.0
    let buttonHeight: Double = 60.0
    let space: Double = 100.0
    let point: Int = 10
    let timeInterval: Double = 0.01
    let maxTime: Double = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTimer()
        initButtons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.score = self.score
        }
    }
    
    func initButtons(){
        let screenWidth = self.view.frame.width
        let screenHeight = self.view.frame.height
        
        let centerX = screenWidth / 2
        let centerY = screenHeight / 2
        
        numArray.shuffle()
        
        for num in numArray {
            let bx = Double(centerX) + space * Double((num % 3) - 1)
            let by = Double(centerY) + space * Double((num / 3) - 1) + 200
            let button = UIButton(type: .system)
            button.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: buttonHeight)
            button.addTarget(self, action: #selector(self.clickAction(sender:)), for: .touchUpInside)
            button.setTitle(String(numArray[num]), for: .normal)
            button.tintColor = UIColor.white
            button.backgroundColor = UIColor.systemBlue
            button.center = CGPoint(x: bx, y: by)
            buttonArray.append(button)
            self.view.addSubview(button)
        }
    }
    
    func initTimer(){
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        timerCount = maxTime
        score = 0
        scoreLabel.text = String(score)
    }
    
    func reset(){
        numArray.shuffle()
        var i = 0
        for button in buttonArray {
            button.setTitle(String(numArray[i]), for: .normal)
            button.isEnabled = true
            i += 1
        }
        index = 0
    }
    
    func restart(){
        initTimer()
        reset()
    }
    
    @objc func up(){
        timerCount -= timeInterval
        if timerCount < 0 {
            if timer.isValid {
                timer.invalidate()
            }
            performSegue(withIdentifier: "toResultView", sender: nil)
        } else {
            timerLabel.text = String(format: "%.2f", timerCount)
        }
    }
    
    @IBAction func clickAction(sender: UIButton){
        print(String(Int(sender.title(for: .normal)!)!))
        if index == Int(sender.title(for: .normal)!)! {
            index += 1
            score += point
            scoreLabel.text = String(score)
            sender.setTitle("", for: .normal)
            sender.isEnabled = false;
            
            if index == numArray.count {
                reset()
            }
        }
    }
    
    
}

