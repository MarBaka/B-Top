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
    var contacts : [Contacts]?
    var branches : [Branches]?
    var services : [Services]?
    var actions : [Actions]?
    var added : String?
    var updated : String?
    
}

class Contacts : Decodable {
    
    var type : String?
    var contact : String?
    
}

class Branches : Decodable {
    
    var address : String?
    var latitude : String?
    var longitude : String?
    
}

class Services : Decodable {
    
    var title : String?
    var description : String?
    var price : String?
    
}

class Actions : Decodable {
    
    var id : Int?
    var title : String?
    var description : String?
    var end_date : String?
    var action_image : String?
    
}















