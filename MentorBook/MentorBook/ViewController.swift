//
//  ViewController.swift
//  MentorBook
//
//  Created by konatsu_p on 2020/02/04.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    
    var mentorArray: [Mentor] = []
    
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mentorArray.append(Mentor(name: "ながた", course: "iPhone", imageName: "nagata.jpg"))
        mentorArray.append(Mentor(name: "りょう", course: "Unity", imageName: "ryo.jpg"))
        mentorArray.append(Mentor(name: "たいてぃ", course: "WebD, WebS", imageName: "taithi.JPG"))
        
        setUI()
    }
    
    func setUI(){
        imageView.image = mentorArray[index].getImage()
        nameLabel.text = mentorArray[index].name
        courseLabel.text = mentorArray[index].course
    }
    
    @IBAction func prev(){
        if index > 0 {
            index -= 1
            setUI()
        }
    }
    
    @IBAction func next(){
        if index < 2 {
            index += 1
            setUI()
        }
        
    }
    
    
}

