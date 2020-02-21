//
//  ViewController.swift
//  TodoApp
//
//  Created by konatsu_p on 2020/02/21.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var taskArray: [String] = []
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        if let tasks = defaults.object(forKey: "TASKS") as? [String] {
            taskArray = tasks
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = taskArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            taskArray.remove(at: indexPath.row)
            defaults.set(taskArray, forKey:"TASKS")
            defaults.synchronize()
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            
        }
    }
    
    func addTask(task: String){
        taskArray.append(task)
        defaults.set(taskArray, forKey:"TASKS")
        defaults.synchronize()
        self.tableView.reloadData()
    }
    
//    @IBAction func openAdd(){
//        self.performSegue(withIdentifier: "toAdd", sender: nil)
//    }

}

