//
//  ContactsTableViewCell.swift
//  B-Store
//
//  Created by Marat on 14.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit



class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var contactLabel : UILabel!
    @IBOutlet weak var imgView : UIImageView!
    
    func setData (data : Contact) {
        
        self.contactLabel.text = data.contact!
        self.imgView.image = UIImage(named: data.type!)
        
    }

}
