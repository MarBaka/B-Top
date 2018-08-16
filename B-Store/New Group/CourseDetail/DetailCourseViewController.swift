//
//  DetailCourseViewController.swift
//  B-Store
//
//  Created by Marat on 12.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class DetailCourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CoursesDelegate {
    
    
    func courseInfoEnumSelected(type: CourseEnum, completion: @escaping () -> ()?) {
        self.currentCourseInfoEnum = type
        self.tableView.reloadData()
    }
    
    weak var delegated : CoursesDelegate?
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if self.currentCourseDetails.id != nil {
            return 2
        }
        return 1
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
        return 100
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 350
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 350
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderTableViewCell
            return cell
        }
        
        if indexPath.section == 1 {
            if self.currentCourseInfoEnum == .branches {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell") as! LocationTableViewCell
                cell.locationLabel.text = self.currentCourseDetails.branches![indexPath.row].address
                return cell
            } else if self.currentCourseInfoEnum == .contacts {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactsTableViewCell
                cell.setData(data: self.currentCourseDetails.contacts![indexPath.row])
                return cell
                
            } else if self.currentCourseInfoEnum == .description {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell") as! DescriptionTableViewCell
                cell.textView.text = self.currentCourseDetails.description!
                return cell
                
            } else if self.currentCourseInfoEnum == .promotion {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "ActionTableViewCell") as! ActionTableViewCell
                cell.setData(data: self.currentCourseDetails.actions![indexPath.row])
                return cell
                
            } else if self.currentCourseInfoEnum == .services {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "TariffTableViewCell") as! TariffTableViewCell
                cell.setData(data: self.currentCourseDetails.services![indexPath.row])
                
            }
        }
        
        let cell = UITableViewCell()
        return cell
    }
}
