//
//  Courses.swift
//  B-Store
//
//  Created by Marat on 11.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation


class Course : Decodable {
    
    var id : Int?
    var subcategories : [SubCategory]?
    var description : String?
    var title : String?
    var main_image_url : String?
    var logo_image_url : String?
    var status : String?
    var tariff : String?
    
}
