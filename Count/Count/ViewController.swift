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
        label.text = String(number)
    }
    
    @IBAction func minus(){
        number -= 1
        label.text = String(number)
    }
    
    @IBAction func times2(){
        number *= 2
        label.text = String(number)
    }
    
    @IBAction func divide2(){
        number /= 2
        label.text = String(number)
    }
    
    @IBAction func clear(){
        number = 0
        label.text = String(number)
    }
    
}

