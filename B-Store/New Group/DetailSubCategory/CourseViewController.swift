//
//  DetailSubCategoryViewController.swift
//  B-Store
//
//  Created by Marat on 11.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView : UITableView!
    var courseID = 2
    var courses : [Course] = []
    var name  = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerManager.shared.getCoursesOfSubCategory(id: courseID, completion: printCourses, error: printError)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 130
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    override func viewDidAppear(_ animated: Bool) {
        ServerManager.shared.getCoursesOfSubCategory(id: courseID, completion: printCourses, error: printError)

    }
    func printCourses (courses : [Course]) {
        
        for c in courses {
            print(c.description)
        }
        self.courses = courses
        self.tableView.reloadData()
        
    }
    func printError (error : String) {
        print(error)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 && self.courses.count != 0{
            return 1
        } else if self.courses.count != 0 {
            return self.courses.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // instansiate course header cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "courseHeaderCell") as! CourseHeaderTableViewCell
            cell.setData(imageURL: self.courses[indexPath.row].main_image_url, title: name)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! CourseTableViewCell
        cell.setData(course: self.courses[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 190
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section != 0 {
            
            let board = UIStoryboard(name: "Main", bundle: nil)
            let vc = board.instantiateViewController(withIdentifier: "courseDetailVC") as! DetailCourseViewController
            vc.currentCourseID = self.courses[indexPath.row].id!
            self.navigationController?.show(vc, sender: self)
            
        }
    }
    


}
