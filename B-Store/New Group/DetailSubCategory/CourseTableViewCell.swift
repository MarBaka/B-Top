//
//  CourseTableViewCell.swift
//  B-Store
//
//  Created by Marat on 11.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher

class CourseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImgView : UIImageView!
    @IBOutlet weak var bannerImgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var discriptionLabel : UILabel!
    
    func setData (course : Course) {
        titleLabel.text = course.title
        discriptionLabel.text = course.description
        if let logo = course.logo_image_url  {
            let url = URL(string: logo)
            logoImgView.kf.setImage(with: url)
        }
        if let banner = course.main_image_url  {
            let url = URL(string: banner)
            bannerImgView.kf.setImage(with: url)
        }
    }
}
