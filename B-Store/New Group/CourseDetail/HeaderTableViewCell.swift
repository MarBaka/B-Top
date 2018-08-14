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
    
    var delegate : CoursesDelegate?

    override func awakeFromNib() {
        infoButtonTapped()
    }
    
    @IBAction func servicesButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = false
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
        

        
        delegate?.courseInfoEnumSelected(type: .services)
        
    }
    
    @IBAction func infoButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = false
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
        
        delegate?.courseInfoEnumSelected(type: .description)
    }
    
    @IBAction func locationButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = false
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
        

        delegate?.courseInfoEnumSelected(type: .branches)
    }
    
    @IBAction func contactsButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = false
        actionButtonSelectedView.isHidden = true
        

        delegate?.courseInfoEnumSelected(type: .contacts)
    }
    
    @IBAction func actionButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = false
        
        delegate?.courseInfoEnumSelected(type: .services)
        
    }
}
