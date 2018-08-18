//
//  ViewController.swift
//  B-Store
//
//  Created by Marat on 16.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView : UITableView!

    var data : MainPageData?
    var pageNum = 1
    var rowLimit = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        ServerManager.shared.getMainPageData(pageSize: rowLimit, pageNum: 1, completion: printData, error: printError)
        
    }
    
    func printData (data : MainPageData) {
        
        self.data = data
        self.tableView.reloadData()
        
    }
    func printError (error : String ) {
        
        print(error)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return pageNum
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.data?.count != nil {
            return self.data!.results!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataTableViewCell
        if self.data?.results != nil {
            
            cell.setData(data: self.data!.results![indexPath.row])
            
        } else {
            cell.textLabel?.text = "NIL"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        rowLimit += 20
        pageNum += 1
        ServerManager.shared.getMainPageData(pageSize: rowLimit, pageNum: 1, completion: printData, error: printError)
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == data!.results!.count - 1 {
            rowLimit += 20
            pageNum += 1
            ServerManager.shared.getMainPageData(pageSize: rowLimit, pageNum: 1, completion: printData, error: printError)

            tableView.reloadData()
        
        }
        
    }

}
