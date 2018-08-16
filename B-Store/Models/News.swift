//
//  News.swift
//  B-Store
//
//  Created by Marat on 16.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation



class News : Decodable {
    
    var results : [NewsResults]?
    var count : Int?
    
}

class NewsResults : Decodable {
    var id : Int?
    var title : String?
    var description : String?
    var news_image : String?
    var added : String?
}



