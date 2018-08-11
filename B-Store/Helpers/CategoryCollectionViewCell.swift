//
//  CategoryTableViewCell.swift
//  B-Store
//
//  Created by Marat on 09.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher
class CategoryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    
    var imgPath = ""
    

    func setData (subcategory: SubCategory) {
        
        titleLabel.text = subcategory.title
        
        guard let url = URL(string: subcategory.sub_category_image_url ?? "") else { return }
        imgView.kf.setImage(with: url)
        
    }
    
    func setData (category: Category) {
        
        titleLabel.text = category.title
        
        guard let url = URL(string: category.category_image_url ?? "") else { return }
        imgView.kf.setImage(with: url)
        
    }
    

}
