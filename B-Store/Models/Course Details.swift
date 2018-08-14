//
//  Course Details.swift
//  B-Store
//
//  Created by Marat on 12.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation


class CourseDetails : Decodable {
    
    var id : Int?
    var title : String?
    var description : String?
    var main_image_url : String?
    var logo_image_url : String?
    var contacts : [Contact]?
    var branches : [Branch]?
    var services : [Service]?
    var actions : [Action]?
    var added : String?
    var updated : String?
    
}

class Contact : Decodable {
    
    var type : String?
    var contact : String?
    
}

class Branch : Decodable {
    
    var address : String?
    var latitude : String?
    var longitude : String?
    
}

class Service : Decodable {
    
    var title : String?
    var description : String?
    var price : String?
    
}

class Action : Decodable {
    
    var id : Int?
    var title : String?
    var description : String?
    var end_date : String?
    var action_image : String?
    
}















