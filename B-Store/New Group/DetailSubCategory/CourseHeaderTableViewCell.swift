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
    
    func setData (imageURL : String?, title : String) {
        
        titleLabel.text = title
        
        guard let u = imageURL else { return }
        let url = URL(string: u)
        imgView.kf.setImage(with: url)
        
    }
}
