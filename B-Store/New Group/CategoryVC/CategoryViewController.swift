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
    
    let exampleCategoryId = 11
    
    var categories : [Category] = []
    
    override func viewDidLoad () {
        super.viewDidLoad()
        ServerManager.shared.getCategories(completion: printCategories, error: printError)
        ServerManager.shared.getCourseDetails(id: 8, completion: isGettingCourseDetails, error: printError)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.contentInset = UIEdgeInsets(top: cellInset, left: cellInset, bottom: cellInset, right: cellInset)
    }
    
    func isGettingCourseDetails (data : CourseDetails) {
        
        print("COURSE DETAILS")
        print(data.services![0].description)
        
    }
    
    func printCategories (result : [Category]) {
        for c in result {
            print(c.title ?? "Whoops! Something went wrong")
        }
        self.categories = result
        collectionView.reloadData()
    }
    
    func printSubCategories (result : SubCategory) {
       
        print(result.title ?? "Whoops! Something went wrong")
        
    }
    
    func printError (error : String) {
        print(error)
    }
    
    func collectionView (_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthOfCell = (UIScreen.main.bounds.width - 60 ) / 2
        return CGSize(width: widthOfCell, height: widthOfCell)
        
    }
    
    func collectionView (_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionCell
     
        cell.setData(category: self.categories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let board = UIStoryboard(name: "Main", bundle: nil)
        let vc = board.instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryViewController
        vc.currentCategoryTitle = self.categories[indexPath.row].title!
        vc.currentSubCategoryId = self.categories[indexPath.item].id!
        self.navigationController!.show(vc, sender: self)
    }
}

