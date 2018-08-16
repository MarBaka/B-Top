//
//  NewsTableViewCell.swift
//  B-Store
//
//  Created by Marat on 16.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionTextView : UITextView!
    
    func setData (data : NewsResults) {
        
        self.mainImgView.kf.setImage(with: URL(string: data.news_image!))
        self.descriptionTextView.text = data.description!
        self.titleLabel.text = data.title!
    }
}
