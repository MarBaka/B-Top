//
//  CourseHeaderTableViewCell.swift
//  B-Store
//
//  Created by Marat on 11.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher

class CourseHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    
    func setData (data : Course, title : String) {
        
        titleLabel.text = title
        
        guard let _ = data.logo_image_url else { return }
        let url = URL(string: data.logo_image_url!)
        imgView.kf.setImage(with: url)
        
    }

}
