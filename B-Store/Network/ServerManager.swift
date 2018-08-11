//
//  ServerManager.swift
//  B-Store
//
//  Created by Marat on 09.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation


class ServerManager: HTTPRequestManager {
    static let shared = ServerManager()
    
    func getCategories(completion: @escaping ([Category]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.categories, completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([Category].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    func getSubCategories(id : Int, completion: @escaping ([SubCategory]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: "\(Constants.Network.EndPoint.categories)\(id)/", completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([SubCategory].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getCoursesOfSubCategory(id : Int, completion: @escaping ([SubCategory]) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: "\(Constants.Network.EndPoint.subcategories)\(id)/", completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode([SubCategory].self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
}
