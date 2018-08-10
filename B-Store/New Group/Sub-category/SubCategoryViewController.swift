//
//  SubCategoryViewController.swift
//  B-Store
//
//  Created by Marat on 09.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class SubCategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var navigationBar : UINavigationBar!

    var currentSubCategoryId = 0
    var currentCategoryTitle = ""
    var currentSubCategories : [SubCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        ServerManager.shared.getSubCategories(id: currentSubCategoryId, completion: printSubCategory, error: printError)
        navigationBar.topItem!.title = currentCategoryTitle
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
         ServerManager.shared.getSubCategories(id: currentSubCategoryId, completion: printSubCategory, error: printError)
        navigationBar.topItem!.title = currentCategoryTitle
        self.collectionView.reloadData()
    }
    
    func printSubCategory (result : [SubCategory]) {
        for sc in result {
            print(sc.title ?? "empty")
        }
        currentSubCategories = result
        self.collectionView.reloadData()

    }
    
    func printError(error : String) {
        print(error)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentSubCategories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionCell
        cell.setData(imgPath: self.currentSubCategories[indexPath.item].sub_category_image_url!, title: self.currentSubCategories[indexPath.item].title!)
        return cell
    }

}
