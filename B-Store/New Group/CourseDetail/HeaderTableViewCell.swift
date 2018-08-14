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
    
    var tableView : UITableView?
    

    override func awakeFromNib() {
        descriptionButtonTapped()
    }
    
    @IBAction func descriptionButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = false
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
        
        if tableView != nil {
            tableView!.reloadData()
        }
        
    }
    
    @IBAction func infoButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = false
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
        
        if tableView != nil {
            tableView!.reloadData()
        }
    }
    
    @IBAction func locationButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = false
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = true
        
        if tableView != nil {
            tableView!.reloadData()
        }
        
    }
    
    @IBAction func contactsButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = false
        actionButtonSelectedView.isHidden = true
        
        if tableView != nil {
            tableView!.reloadData()
        }
        
    }
    
    @IBAction func actionButtonTapped () {
        
        descriptionButtonSelectedView.isHidden = true
        infoButtonSelectedView.isHidden = true
        locationButtonSelectedView.isHidden = true
        contactsButtonSelectedView.isHidden = true
        actionButtonSelectedView.isHidden = false
        
        if tableView != nil {
            tableView!.reloadData()
        }
        
    }
}
