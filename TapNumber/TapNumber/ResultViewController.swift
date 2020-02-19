//
//  ResultViewController.swift
//  TapNumber
//
//  Created by konatsu_p on 2020/02/19.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)
    }
    
    @IBAction func restart(){
        let vc = self.presentingViewController as! ViewController
        vc.restart()
        dismiss(animated: true, completion: nil)
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
