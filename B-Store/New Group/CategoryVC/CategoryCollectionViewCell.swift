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
    

    func setData (imgPath : String, title : String) {
        
        
        let url = URL(string: imgPath)
        imgView.kf.setImage(with: url)
        
        titleLabel.text = title
        
    }

}
