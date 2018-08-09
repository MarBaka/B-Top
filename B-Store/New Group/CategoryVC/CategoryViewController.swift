//
//  ViewController.swift
//  B-Store
//
//  Created by Marat on 09.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView : UICollectionView!
    
    let cellInset = 15.0 as CGFloat
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getCities(completion: printCategories, error: printError)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.contentInset = UIEdgeInsets(top: cellInset, left: cellInset, bottom: cellInset, right: cellInset)
    }
    
    func printCategories(result : [Category]) {
        for c in result {
            print(c.title ?? "Whoops! Something went wrong")
        }
        DataManager.manager.categories = result
        collectionView.reloadData()
    }
    
    func printError(error : String) {
        print(error)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.manager.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthOfCell = (UIScreen.main.bounds.width - 60 ) / 2
        return CGSize(width: widthOfCell, height: widthOfCell)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionCell
     
        cell.setData(imgPath: DataManager.manager.categories[indexPath.item].category_image_url!, title: DataManager.manager.categories[indexPath.item].title!)
        return cell
    }


}

