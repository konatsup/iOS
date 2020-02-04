//
//  ViewController.swift
//  ItsuDareGame
//
//  Created by konatsu_p on 2020/02/03.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var whenLabel: UILabel!
    @IBOutlet var whereLabel: UILabel!
    @IBOutlet var whoLabel: UILabel!
    @IBOutlet var whatLabel: UILabel!
    
    let whenArray: [String] = ["一年前", "一週間前", "昨日", "今日", "10年前", "ああああ"]
    let whereArray: [String] = ["山の上で", "アメリカで", "学校で", "クラスで", "南極で", "いいいい"]
    let whoArray: [String] = ["僕が", "大統領が", "先生が", "友達が", "総理が", "うううう"]
    let whatArray: [String] = ["叫んだ", "演説した", "怒った", "踊った", "寒そうにしていた", "ええええ"]
    
    var index: Int! = 0
    
    var size: Int! = 6

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func change(){
        whenLabel.text = whenArray[index]
        whereLabel.text = whereArray[index]
        whoLabel.text = whoArray[index]
        whatLabel.text = whatArray[index]
        
        index += 1
        if index > (size - 1) {
            index = 0
        }
        
    }
    
    @IBAction func reset(){
        whenLabel.text = "---"
        whereLabel.text = "---"
        whoLabel.text = "---"
        whatLabel.text = "---"
        index = 0
    }
    
    @IBAction func random(){
        let whenIndex = Int.random(in: 0...(size - 1))
        let whereIndex = Int.random(in: 0...(size - 1))
        let whoIndex = Int.random(in: 0...(size - 1))
        let whatIndex = Int.random(in: 0...(size - 1))
        
        print("いつ: \(whenIndex)")
        print("どこで: \(whereIndex)")
        print("だれが: \(whoIndex)")
        print("どうした: \(whatIndex)")
        
        
        whenLabel.text = whenArray[whenIndex]
        whereLabel.text = whereArray[whereIndex]
        whoLabel.text = whoArray[whoIndex]
        whatLabel.text = whatArray[whatIndex]
        
    }


}

