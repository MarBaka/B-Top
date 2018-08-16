//
//  DetailCourseViewController.swift
//  B-Store
//
//  Created by Marat on 12.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class DetailCourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CoursesDelegate {
    
    
    
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
    
    func courseInfoEnumSelected(type: CourseEnum) {
        
        currentCourseInfoEnum = type
        print(type)
        tableView.reloadData()
        
    }
    
    func getCourseDetails (details : CourseDetails) {
        
        self.currentCourseDetails = details
        self.tableView.reloadData()
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
        }
        if currentCourseInfoEnum == .description {
            return 1
        }
        if currentCourseInfoEnum == .services {
            return self.currentCourseDetails.services!.count
        }
        if currentCourseInfoEnum == .branches {
            return self.currentCourseDetails.branches!.count
        }
        if currentCourseInfoEnum == .contacts {
            return currentCourseDetails.contacts!.count
        }
        if currentCourseInfoEnum == .promotion {
            return currentCourseDetails.actions!.count
        }
        return 100
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 350
        } else {
            return UITableViewAutomaticDimension
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
            cell.setData(data: self.currentCourseDetails)
            cell.delegate = self
            return cell
        }
        
            if self.currentCourseInfoEnum == .branches {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell") as! LocationTableViewCell
                cell.locationLabel.text = self.currentCourseDetails.branches![indexPath.row].address
                return cell
            }
        if self.currentCourseInfoEnum == .contacts {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactsTableViewCell
                cell.setData(data: self.currentCourseDetails.contacts![indexPath.row])
                return cell
                
            }
        if self.currentCourseInfoEnum == .description {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell") as! DescriptionTableViewCell
                cell.textView.text = self.currentCourseDetails.description!
                return cell
                
            }
        if self.currentCourseInfoEnum == .promotion {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "ActionTableViewCell") as! ActionTableViewCell
                cell.setData(data: self.currentCourseDetails.actions![indexPath.row])
                return cell
                
            }
        if self.currentCourseInfoEnum == .services {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "TariffTableViewCell") as! TariffTableViewCell
                cell.setData(data: self.currentCourseDetails.services![indexPath.row])
                return cell
            }
        
        
        let cell = UITableViewCell()
        return cell
    }
}
