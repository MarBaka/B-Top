//
//  CoursesDelegate.swift
//  B-Store
//
//  Created by Marat on 14.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation


protocol CoursesDelegate: class  {
    
    func courseInfoEnumSelected (type : CourseEnum, completion : @escaping ()->()?) 
    
}
