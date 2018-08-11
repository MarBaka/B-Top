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
    
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var discriptionLabel : UILabel!
    
    func setData (course : Course) {
        titleLabel.text = course.title
        discriptionLabel.text = course.description
        guard let _ = course.logo_image_url else { return }
        let url = URL(string: course.logo_image_url!)
        imgView.kf.setImage(with: url)
    }
    
}
