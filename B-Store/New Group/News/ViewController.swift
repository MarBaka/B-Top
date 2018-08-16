//
//  ViewController.swift
//  B-Store
//
//  Created by Marat on 16.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView : UITableView!

    var news : News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print("lkanwrnleknlfip;nifpwen;pgih[nri")
        
            ServerManager.shared.getNews(completion: printNews, error: printError)
    }
    
    func printNews (news : News) {
        
        self.news = news
        self.tableView.reloadData()
        
    }
    func printError (error : String ) {
        
        print(error)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.news?.count != nil {
            return self.news!.count!
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NewsTableViewCell
        if self.news?.results != nil {
            
            cell.setData(data: self.news!.results![indexPath.row])
        } else {
            cell.textLabel?.text = "NIL"
        }
        
        return cell
    }

}
