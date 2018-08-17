//
//  News.swift
//  B-Store
//
//  Created by Marat on 16.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation



class MainPageData : Decodable {
    
    var results : [MainPageResult]?
    var count : Int?
    
}

class MainPageResult : Decodable {
    
//    id": 13,
//    "subcategories": [
//    {
//    "id": 1,
//    "title": "Английский",
//    "subcategory_image_url": "http://drive.google.com/uc?export=view&id=1dLw5dXK9atSlqx37tFTqsAO4z9d5g9cw"
//    }
//    "title": "Академия Роста",
//    "description": "Мы работаем для того, чтобы каждый ученик Академии раскрыл собственный потенциал, реализовал себя и обрел успешное будущее. И главным элементом на пути развития и процветания наших детей является уникальная, высокоэффективная программа развития интеллекта",
//    "main_image_url": "http://drive.google.com/uc?export=view&id=1jQw92MwSF7f3w9LI9jTszibqYdU_QRsy",
//    "logo_image_url": "http://drive.google.com/uc?export=view&id=1fWAD_1DQolDYK6Qv-bSPlQDi3gl0s11Z",
//    "status": "ACTIVE",
//    "tariff": "VIP"
    var id : Int?
    var title : String?
    var description : String?
    var main_image_url : String?
    var logo_image_url : String?

}



