//
//  ViewController.swift
//  B-Store
//
//  Created by Marat on 09.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getCities(completion: printCategories, error: printError)
    }
    func printCategories(result : [Category]) {
        for c in result {
            print(c.title ?? "Whoops! Something went wrong")
        }
    }
    func printError(error : String) {
        print(error)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }


}

