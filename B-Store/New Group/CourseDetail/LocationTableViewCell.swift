//
//  LocationTableViewCell.swift
//  B-Store
//
//  Created by Marat on 14.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel : UILabel!
    @IBOutlet weak var mapPointButton : UIButton!
    
    var indexPathRow = 0
    
    var delegate : MapCoordinatesDelegate?
    
    
    
    func setData (text : String, row : Int) {
        
        self.locationLabel.text = text
        self.indexPathRow = row
        
    }
    
    @IBAction func mapPointButtonTapped () {
        
        delegate?.showMapVC(selectedRow : indexPathRow)
        
    }
}
