//
//  ViewController.swift
//  B-Store
//
//  Created by Marat on 09.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var colView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getCities(completion: printCategories, error: printError)
    }
    func printCategories(result : [Category]) {
        for c in result {
            print(c.title ?? "Whoops! Something went wrong")
        }
        DataManager.manager.categories = result     
    }
    func printError(error : String) {
        print(error)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.manager.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }


}

