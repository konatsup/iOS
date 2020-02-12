//
//  QuizViewController.swift
//  Quiz
//
//  Created by konatsu_p on 2020/02/10.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [Any]()
        
        tmpArray.append(["問題文1", "選択肢1", "選択肢2", "選択肢3", 1])
        tmpArray.append(["問題文2", "選択肢1", "選択肢2", "選択肢3", 2])
        tmpArray.append(["問題文3", "選択肢1", "選択肢2", "選択肢3", 2])
        tmpArray.append(["問題文4", "選択肢1", "選択肢2", "選択肢3", 3])
        tmpArray.append(["問題文5", "選択肢1", "選択肢2", "選択肢3", 3])
        tmpArray.append(["問題文6", "選択肢1", "選択肢2", "選択肢3", 3])
        
        while(tmpArray.count > 0){
            let index = Int(arc4random()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        
        choiceQuiz()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            correctAnswer = correctAnswer + 1
        }
        
        quizArray.remove(at: 0)
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
        
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    func choiceQuiz(){
        
        let tmpArray = quizArray[0] as! [Any]
        
        quizTextView.text = tmpArray[0] as! String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
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
