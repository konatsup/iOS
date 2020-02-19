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
    
    var numArray: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    var index: Int = 0
    
    let buttonWidth = 60.0
    let buttonHeight = 60.0
    let space = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        
    }
    
    func initialize(){
        numArray.shuffle()
        
        let screenWidth = self.view.frame.width
        let screenHeight = self.view.frame.height
        
        let centerX = screenWidth / 2
        let centerY = screenHeight / 2
        
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
            self.view.addSubview(button)
        }
    }
    
    @IBAction func clickAction(sender: UIButton){
        print(String(Int(sender.title(for: .normal)!)!))
        if index == Int(sender.title(for: .normal)!)! {
            index += 1
            sender.setTitle("", for: .normal)
            sender.isEnabled = false;
            
            if index == numArray.count {
                initialize()
                index = 0
            }
        }
    }
    
    
}

