//
//  DetailCourseViewController.swift
//  B-Store
//
//  Created by Marat on 12.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class DetailCourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CoursesDelegate, MapCoordinatesDelegate {
    
    
    weak var delegated : CoursesDelegate?
    @IBOutlet weak var tableView : UITableView!
    
    var currentCourseID  = 0
    var currentCourseDetails = CourseDetails()
    var currentCourseInfoEnum : CourseEnum = .description
    
    var indexOfBranchSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        
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
    
    func showMapVC(selectedRow : Int) {
        
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapVC") as! MapViewController
        vc.setData(data: self.currentCourseDetails.branches![selectedRow])
        self.navigationController?.show(vc, sender: self)
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
            cell.setData(text: self.currentCourseDetails.branches![indexPath.row].address!, row: indexPath.row)
            if self.currentCourseDetails.branches![indexPath.row].latitude == nil && self.currentCourseDetails.branches![indexPath.row].longitude == nil {
                cell.mapPointButton.isHidden = true
            }
            cell.delegate = self
            return cell
        }
        if self.currentCourseInfoEnum == .contacts {
                
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactsTableViewCell
            cell.setData(data: self.currentCourseDetails.contacts![indexPath.row])
            return cell
                
        }
        if self.currentCourseInfoEnum == .description {
                
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell") as! DescriptionTableViewCell
            cell.textLbl.text = self.currentCourseDetails.description!
            
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
