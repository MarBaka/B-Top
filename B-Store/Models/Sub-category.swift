//
//  Sub-category.swift
//  B-Store
//
//  Created by Marat on 09.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation


class SubCategory : Decodable {
    var id : Int?
    var title : String?
    var parents : Int?
    var subcategory_image_url : String?
}
