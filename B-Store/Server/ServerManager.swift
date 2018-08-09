//
//  ServerManager.swift
//  JardamBeremApp
//
//  Created by Ulan Nurmatov on 7/30/18.
//  Copyright © 2018 Ulan Nurmatov. All rights reserved.
//

import Foundation

class ServerManager: HTTPRequestManager {
    static let shared = ServerManager()
    
    func getCities(completion: @escaping (CityResult) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.cities, completion: { (data) in
            //TODO
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode(CityResult.self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }

    func getCategories(cityID : String, completion : @escaping (CategoryResult) -> (), error : @escaping (String) -> ()) {
        self.get(endpoint: "\(Constants.Network.EndPoint.categories)", completion: { (responce) in
            
            do {
                guard let  data = responce else { return }
                let result = try JSONDecoder().decode(CategoryResult.self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) {(errorMessage) in
            error(errorMessage)
        }
    }
    
    func getCharities(completion: @escaping (CharityResults) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.charities, completion: { (data) in
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode(CharityResults.self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getForum(completion: @escaping (ForumResults) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: Constants.Network.EndPoint.forum, completion: { (data) in
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode(ForumResults.self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    
    func getAnnouncements(categoryId: Int, completion: @escaping (AnnouncementsResults) -> (), error: @escaping (String) -> ()) {
        self.get(endpoint: "\(Constants.Network.EndPoint.announcements)\(categoryId)/announcements", completion: { (data) in
            do {
                guard let  data = data else { return }
                let result = try JSONDecoder().decode(AnnouncementsResults.self, from: data)
                completion(result)
            }
            catch let errorMessage {
                error(errorMessage.localizedDescription)
            }
            
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
    func sendReview(review : Review, completion: @escaping () -> (), error: @escaping (String) -> ()) {
        
        self.post(endpoint: Constants.Network.EndPoint.reviewPost, parameters: review.reviewToDictionary(), completion: { (data) in
            completion()
        }) { (errorMessage) in
            error(errorMessage)
        }
    }
}
