//
//  HeaderTableViewCell.swift
//  B-Store
//
//  Created by Marat on 14.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    
    @IBOutlet weak var descriptionButtonSelectedView : UIView!
    @IBOutlet weak var infoButtonSelectedView : UIView!
    @IBOutlet weak var locationButtonSelectedView : UIView!
    @IBOutlet weak var contactsButtonSelectedView : UIView!
    @IBOutlet weak var actionButtonSelectedView : UIView!
    
    

    override func awakeFromNib() {
        descriptionButtonTapped()
        
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
    }
    
    @IBAction func descriptionButtonTapped () {
        
    }
    @IBAction func infoButtonTapped () {
        
    }
    @IBAction func locationButtonTapped () {
        
    }
    @IBAction func contactsButtonTapped () {
        
    }
    @IBAction func actionButtonTapped () {
        
    }
}
