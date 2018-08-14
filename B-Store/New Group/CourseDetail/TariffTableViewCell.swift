//
//  TariffTableViewCell.swift
//  B-Store
//
//  Created by Marat on 14.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class TariffTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionTextView : UITextView!
    @IBOutlet weak var priceLabel : UILabel!
    
    func setData (data : Service) {
        
        self.titleLabel.text = data.title!
        self.priceLabel.text = data.price!
        self.descriptionTextView.text = data.description!
        
    }

}
