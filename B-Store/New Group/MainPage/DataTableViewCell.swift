//
//  NewsTableViewCell.swift
//  B-Store
//
//  Created by Marat on 16.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImgView : UIImageView!
    @IBOutlet weak var mainImgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    
    override func awakeFromNib() {
        
        logoImgView.layer.cornerRadius = logoImgView.frame.height / 2.0
        logoImgView.clipsToBounds = true
        
    }
    
    func setData (data : MainPageResult) {
        
        if  data.logo_image_url != nil {
            self.logoImgView.kf.setImage(with: URL(string: data.logo_image_url!))
        }
        if data.main_image_url != nil {
            self.mainImgView.kf.setImage(with: URL(string: data.main_image_url!))
        }
        
        
        self.descriptionLabel.text = data.description!
        self.titleLabel.text = data.title!
    }
}
