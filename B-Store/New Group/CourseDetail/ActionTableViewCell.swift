//
//  ActionTableViewCell.swift
//  B-Store
//
//  Created by Marat on 14.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher

class ActionTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var endDateLabel : UILabel!
    
    func setData (data : Action) {
        
        if data.action_image != nil {
            let url = URL(string: data.action_image!)
            self.imgView.kf.setImage(with: url)
        }
        
        self.titleLabel.text = data.title!
        self.descriptionLabel.text = data.description!
        self.endDateLabel.text = data.end_date!
        
    }
}
