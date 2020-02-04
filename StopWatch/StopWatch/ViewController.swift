//
//  ViewController.swift
//  StopWatch
//
//  Created by konatsu_p on 2020/02/04.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    
    let threshold: Float = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(){
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
    }
    
    @IBAction func stop(){
        if timer.isValid {
            timer.invalidate()
            self.judge()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid {
            timer.invalidate()
        }
        count = 0.0
        label.text = String(count)
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    func judge(){
        let diff = abs(count - threshold)
        var result = ""
        
        if diff < 0.2 {
            result = "PERFECT"
        } else if diff < 0.3 {
            result = "GREAT"
        } else if diff < 0.5 {
            result = "GOOD"
        } else {
            result = "BAD"
        }
        resultLabel.text = result
    }
    
    
}

