//
//  DetailCourseViewController.swift
//  B-Store
//
//  Created by Marat on 12.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class DetailCourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CoursesDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    
    var currentCourseID  = 0
    var currentCourseDetails = CourseDetails()
    var currentCourseInfoEnum : CourseEnum = .description
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        ServerManager.shared.getCourseDetails(id: currentCourseID, completion: getCourseDetails, error: printError)
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        ServerManager.shared.getCourseDetails(id: currentCourseID, completion: getCourseDetails, error: printError)
        
    }
    
    func getCourseDetails (details : CourseDetails) {
        
        self.currentCourseDetails = details
        
    }
    
    func printError (error : String) {
        
        print(error)
        
    }
    
    func courseInfoEnumSelected(type: CourseEnum) {
        
        self.currentCourseInfoEnum = type
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 1
        } else if currentCourseInfoEnum == .description {
            return 1
        } else if currentCourseInfoEnum == .services {
            return self.currentCourseDetails.services!.count
        } else if currentCourseInfoEnum == .branches {
            return self.currentCourseDetails.branches!.count
        } else if currentCourseInfoEnum == .contacts {
            return currentCourseDetails.contacts!.count
        } else if currentCourseInfoEnum == .promotion {
            return currentCourseDetails.actions!.count
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0  {
            return 345
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderTableViewCell
            return cell
        }
        
        if indexPath.section == 1 {
            
            
            
        }
        
        let cell = UITableViewCell()
        return cell
    }
}
