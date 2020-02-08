//
//  Mentor.swift
//  MentorBook
//
//  Created by konatsu_p on 2020/02/07.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class Mentor{
    var name: String!
    var course: String!
    var imageName: String!
    
    init(name: String, course: String, imageName: String) {
        self.name = name
        self.course = course
        self.imageName = imageName
    }
    
    func getImage() -> UIImage {
        return UIImage(named: imageName)!
    }
}
