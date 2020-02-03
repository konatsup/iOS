//
//  ViewController.swift
//  Count
//
//  Created by konatsu_p on 2020/02/03.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var number: Int = 0
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plus(){
        number += 1
        setText(num: number)
    }
    
    @IBAction func minus(){
        number -= 1
        setText(num: number)
    }
    
    @IBAction func times2(){
        number *= 2
        setText(num: number)
    }
    
    @IBAction func divide2(){
        number /= 2
        setText(num: number)
    }
    
    @IBAction func clear(){
        number = 0
        setText(num: number)
    }
    
    func setText(num: Int){
        if num >= 10 {
            label.textColor = UIColor.red
        } else if num <= -10{
            label.textColor = UIColor.blue
        } else {
            label.textColor = UIColor.init(red: 163/255.0, green: 154/255.0, blue: 196/255.0, alpha: 1.0)
        }
        label.text = String(number)
    }
    
}

