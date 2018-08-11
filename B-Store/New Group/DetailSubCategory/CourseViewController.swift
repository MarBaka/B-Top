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
    var title = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerManager.shared.getCoursesOfSubCategory(id: courseID, completion: printCourses, error: printError)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func printCourses (courses : [Course]) {
        
        for c in courses {
            print(c.description)
        }
        self.courses = courses
        
    }
    func printError (error : String) {
        print(error)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return self.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // instansiate course header cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "courseHeaderCell") as! CourseHeaderTableViewCell
            cell.setData(data: self.courses[indexPath.row])
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! CourseTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UIScreen.main.bounds.height / 2.5
        }
        return 150
    }
    
    @IBAction func backButtonTapped () {
        
    }

}
