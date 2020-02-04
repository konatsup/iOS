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
    @IBOutlet var kanjiLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
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
        var color: UIColor!
        if num >= 0 {
            color = UIColor.init(red: 163/255.0, green: 154/255.0, blue: 196/255.0, alpha: 1.0)
        } else {
//                        color = UIColor.init(red: 132/255.0, green: 162/255.0, blue: 200/255.0, alpha: 1.0)
            color = UIColor.init(red: 166/255.0, green: 166/255.0, blue: 166/255.0, alpha: 1.0)
        }
        
        numberLabel.textColor = color
        kanjiLabel.textColor = color
        
        numberLabel.text = String(num)
        kanjiLabel.text = convertToKanji(num: num)
    }
    
    func convertToKanji(num: Int) -> String {
        var bigNum = abs(num)
        let kanjiNumbers: [String] = ["","壱", "弐", "参", "肆", "伍", "陸", "漆", "捌", "玖"]
        let smallDigits: [String] = ["", "拾", "佰", "仟"]
        let bigDigits: [String] = ["", "萬", "億", "兆", "京", "垓"]
        var kanji = ""
        var smallCount = 0
        var bigCount = 0
        while(true) {
            var smallNum = bigNum % 10000
            kanji = bigDigits[bigCount] + kanji
            smallCount = 0
            while(true){
                let rest = smallNum % 10
                if(rest != 0){
                    if(rest == 1 && smallCount > 0){
                        kanji = smallDigits[smallCount] + kanji
                    } else {
                        kanji = kanjiNumbers[rest] + smallDigits[smallCount] + kanji
                    }
                }
                if((smallNum - 9) <= 0) { break };
                smallNum = smallNum / 10
                smallCount += 1
            }
            if((bigNum - 9999) <= 0) { break };
            bigNum = bigNum / 10000
            bigCount += 1
        }
        
        if kanji.isEmpty {
            kanji = "零"
        }
        
        print(num)
        print(kanji)
        
        if(num < 0){
            kanji = "負" + kanji
        }
        return kanji
    }
    
}

