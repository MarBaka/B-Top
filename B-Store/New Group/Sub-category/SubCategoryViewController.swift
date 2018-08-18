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

    var currentSubCategoryId = 0
    var currentCategoryTitle = ""
    var currentSubCategories : [SubCategory] = []
    let cellInset = 15.0 as CGFloat

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        ServerManager.shared.getSubCategories(id: currentSubCategoryId, completion: printSubCategory, error: printError)
        self.navigationItem.title = currentCategoryTitle
        collectionView.contentInset = UIEdgeInsets(top: cellInset, left: cellInset, bottom: cellInset, right: cellInset)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
         ServerManager.shared.getSubCategories(id: currentSubCategoryId, completion: printSubCategory, error: printError)
        self.navigationItem.title = currentCategoryTitle
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
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthOfCell = (UIScreen.main.bounds.width - 60 ) / 2
        return CGSize(width: widthOfCell, height: widthOfCell)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentSubCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionCell
        cell.setData(subcategory: self.currentSubCategories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let board = UIStoryboard(name: "Main", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "CourseVC") as! CoursesViewController
        vc.name = self.currentSubCategories[indexPath.item].title!
        vc.courseID = self.currentSubCategories[indexPath.item].id!
        self.navigationController!.show(vc, sender: self)
    }
}
