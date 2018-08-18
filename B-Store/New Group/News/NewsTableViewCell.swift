//
//  NewsTableViewCell.swift
//  B-Store
//
//  Created by Marat on 17.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var dateAdded : UILabel!
    
    override func awakeFromNib() {
        let font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.font = font
    }
    
    func setData (data : NewsResults) {
        
        if data.news_image != nil {
            imgView.kf.setImage(with: URL(string: data.news_image!))
        }
        
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        
        let date = data.added!.components(separatedBy: "-")
        
        dateAdded.text = "Добавлено \(date[2]).\(date[1]).\(date[0])"
        
    }

}
