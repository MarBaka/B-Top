//
//  NewsViewController.swift
//  B-Store
//
//  Created by Marat on 17.08.2018.
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
        

        ServerManager.shared.getNews(completion: printNews, error: printError)
    }
    
    func printNews (news : News) {
        
        print("First news' id is \(news.results?.first?.id)")
        self.news = news
        self.tableView.reloadData()
    }
    
    func printError (error : String) {
        
        print(error)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if news?.count != nil {
            return news!.count!
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
        cell.setData(data: news!.results![indexPath.section])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailNewsVC") as! DetailNewsViewController
        vc.data = self.news!.results![indexPath.section]
        self.navigationController?.show(vc, sender: self)
    }
    
}
