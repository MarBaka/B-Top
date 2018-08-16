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
        
//        servicesButton.removeAllConstraints()
//        descriptionButton.removeAllConstraints()
//        branchesButton.removeAllConstraints()
//        contactsButton.removeAllConstraints()
//        actionButton.removeAllConstraints()
//
//        let servicesButtonLeadingConstranint = NSLayoutConstraint(item: servicesButton, attribute: .left, relatedBy: .equal, toItem: buttonHolderView, attribute: .left, multiplier: 1.0, constant: differenceBetweenButtons)
//        let servicesButtonCenterYConstraint = NSLayoutConstraint(item: servicesButton, attribute: .centerY, relatedBy: .equal, toItem: buttonHolderView, attribute: .centerY, multiplier: 1.0, constant: 0)
//        let servicesButtonheightConstraint = NSLayoutConstraint(item: servicesButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
//        let servicesButtonTrailingConstranint = NSLayoutConstraint(item: servicesButton, attribute: .trailing, relatedBy: .equal, toItem: descriptionButton, attribute: .trailing, multiplier: 1.0, constant: differenceBetweenButtons)
//        let descriptionButtonLeadingConstranint = NSLayoutConstraint(item: descriptionButton, attribute: .leading, relatedBy: .equal, toItem: servicesButton, attribute: .trailing, multiplier: 1.0, constant: differenceBetweenButtons)
//        let descriptionButtonCenterYConstraint = NSLayoutConstraint(item: descriptionButton, attribute: .centerY, relatedBy: .equal, toItem: buttonHolderView, attribute: .centerY, multiplier: 1.0, constant: 0)
//        let descriptionButtonheightConstraint = NSLayoutConstraint(item: descriptionButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
//        let descriptionButtonTrailingConstranint = NSLayoutConstraint(item: descriptionButton, attribute: .trailing, relatedBy: .equal, toItem: branchesButton, attribute: .leading, multiplier: 1.0, constant: differenceBetweenButtons)
//        let branchesButtonLeadingConstranint = NSLayoutConstraint(item: branchesButton, attribute: .leading, relatedBy: .equal, toItem: descriptionButton, attribute: .trailing, multiplier: 1.0, constant: differenceBetweenButtons)
//        let branchesButtonCenterYConstraint = NSLayoutConstraint(item: branchesButton, attribute: .centerY, relatedBy: .equal, toItem: buttonHolderView, attribute: .centerY, multiplier: 1.0, constant: 0)
//        let bramchesButtonheightConstraint = NSLayoutConstraint(item: branchesButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
//        let branchesButtonTrailingConstranint = NSLayoutConstraint(item: branchesButton, attribute: .trailing, relatedBy: .equal, toItem: contactsButton, attribute: .leading, multiplier: 1.0, constant: differenceBetweenButtons)
//        let contactsButtonLeadingConstranint = NSLayoutConstraint(item: contactsButton, attribute: .leading, relatedBy: .equal, toItem: branchesButton, attribute: .trailing, multiplier: 1.0, constant: differenceBetweenButtons)
//        let contactsButtonCenterYConstraint = NSLayoutConstraint(item: contactsButton, attribute: .centerY, relatedBy: .equal, toItem: buttonHolderView, attribute: .centerY, multiplier: 1.0, constant: 0)
//        let contactsButtonheightConstraint = NSLayoutConstraint(item: contactsButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
//        let contactsButtonTrailingConstraint = NSLayoutConstraint(item: contactsButton, attribute: .trailing, relatedBy: .equal, toItem: actionButton, attribute: .leading, multiplier: 1.0, constant: differenceBetweenButtons)
//        let actionsButtonLeadingConstraint = NSLayoutConstraint(item: actionButton, attribute: .leading, relatedBy: .equal, toItem: contactsButton, attribute: .trailing, multiplier: 1.0, constant: differenceBetweenButtons)
//        let actionButtonCenterYConstraint = NSLayoutConstraint(item: actionButton, attribute: .centerY, relatedBy: .equal, toItem: buttonHolderView, attribute: .centerY, multiplier: 1.0, constant: 0)
//        let actionButtonheightConstraint = NSLayoutConstraint(item: actionButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
//        let actionsButtonTrailingConstraint = NSLayoutConstraint(item: actionButton, attribute: .trailing, relatedBy: .equal, toItem: buttonHolderView, attribute: .trailing, multiplier: 1.0, constant: differenceBetweenButtons)
//
//        buttonHolderView.addConstraints([
//            servicesButtonLeadingConstranint, servicesButtonCenterYConstraint, servicesButtonheightConstraint, servicesButtonTrailingConstranint, descriptionButtonLeadingConstranint, descriptionButtonCenterYConstraint, descriptionButtonCenterYConstraint, descriptionButtonheightConstraint, descriptionButtonTrailingConstranint, branchesButtonLeadingConstranint, branchesButtonCenterYConstraint, bramchesButtonheightConstraint, branchesButtonTrailingConstranint, contactsButtonLeadingConstranint, contactsButtonCenterYConstraint, contactsButtonheightConstraint, contactsButtonTrailingConstraint, actionsButtonLeadingConstraint, actionButtonCenterYConstraint, actionButtonheightConstraint, actionButtonheightConstraint, actionsButtonTrailingConstraint])
        
        
        
    }
    
    func removeAllConstraintsFromButtons (objects : [UIButton]) {
        for b in objects {
            for c in b.constraints {
                b.removeConstraint(c)
            }
        }
    }
    
    @IBAction func servicesButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = false
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
        

      
        delegate?.courseInfoEnumSelected(type: .services, completion: funcPlaceholder)
        
    }
    
    @IBAction func infoButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = false
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
        
        delegate?.courseInfoEnumSelected(type: .description, completion: funcPlaceholder)
    }
    
    @IBAction func locationButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = false
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
        

        delegate?.courseInfoEnumSelected(type: .branches, completion: funcPlaceholder)
    }
    
    @IBAction func contactsButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = false
        actionButtonSelectedView.isHidden = true
        

        delegate?.courseInfoEnumSelected(type: .contacts, completion: funcPlaceholder)
    }
    
    @IBAction func actionButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = false
        
        delegate?.courseInfoEnumSelected(type: .services, completion: funcPlaceholder)
        
    }
    func funcPlaceholder () {
        
    }
}
