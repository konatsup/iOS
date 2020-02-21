//
//  AddViewController.swift
//  TodoApp
//
//  Created by konatsu_p on 2020/02/21.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func save(){
        let nc = self.navigationController!
        let vcNum = nc.viewControllers.count
        let vc = nc.viewControllers[vcNum-2] as! ViewController
        vc.addTask(task: textField.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
}
