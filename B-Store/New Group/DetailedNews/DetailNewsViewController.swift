//
//  DetailNewsViewController.swift
//  B-Store
//
//  Created by Marat on 18.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import Kingfisher

class DetailNewsViewController: UIViewController {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var dateAddedLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    
    var data : NewsResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        }
    
    override func viewDidAppear(_ animated: Bool) {
        setData()
    }
    
    func setData () {
        
        imgView.kf.setImage(with: URL(string : data!.news_image!))
        titleLabel.text = data!.title!
        let dateAddedDateArray = data!.added!.components(separatedBy: "-")
        dateAddedLabel.text = "Добавлено \(dateAddedDateArray[2]).\(dateAddedDateArray[1]).\(dateAddedDateArray[0])"
        descriptionLabel.text = data!.description!
        
    }
}
