//
//  HeaderTableViewCell.swift
//  B-Store
//
//  Created by Marat on 14.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var buttonHolderView : UIView!
    
    @IBOutlet weak var descriptionButtonSelectedView : UIView!
    @IBOutlet weak var infoButtonSelectedView : UIView!
    @IBOutlet weak var locationButtonSelectedView : UIView!
    @IBOutlet weak var contactsButtonSelectedView : UIView!
    @IBOutlet weak var actionButtonSelectedView : UIView!
    
    @IBOutlet weak var servicesButton : UIButton!
    @IBOutlet weak var descriptionButton : UIButton!
    @IBOutlet weak var branchesButton : UIButton!
    @IBOutlet weak var contactsButton : UIButton!
    @IBOutlet weak var actionButton : UIButton!
    
    weak var delegate : CoursesDelegate?
    
    
//    let differenceBetweenButtons : CGFloat = (UIScreen.main.bounds.size.width - (25 * 5)) / 6
    
    override func awakeFromNib() {
        infoButtonTapped()
        
    }
    
    func setData (data : CourseDetails) {
        
        if data.main_image_url != nil {
        
            self.imgView.kf.setImage(with: URL(string: data.main_image_url!))
        }
        self.titleLabel.text = data.title
        
    }
    
    @IBAction func servicesButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = false
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
    
        delegate?.courseInfoEnumSelected(type: .services)
        
    }
    
    @IBAction func infoButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = false
        infoButtonSelectedView.isHidden = true
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
        
        delegate?.courseInfoEnumSelected(type: .promotion)
    }
    
}
