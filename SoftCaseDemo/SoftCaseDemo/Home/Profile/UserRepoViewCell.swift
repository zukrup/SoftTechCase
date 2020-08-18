//
//  UserRepoViewCell.swift
//  SoftCaseDemo
//
//  Created by musa fedakar on 18.08.2020.
//  Copyright © 2020 musa fedakar. All rights reserved.
//

import UIKit

class UserRepoViewCell: UITableViewCell {

    @IBOutlet weak var lastUpdatedLabel: MyUILabeLField!
    @IBOutlet weak var repoNameLabel: MyUILabeLField!
    @IBOutlet weak var repoDescriptionLabel: MyUILabeLField!
    @IBOutlet weak var cardView: UIView!
       
    @IBOutlet weak var lastUpdateStrLabel: MyUILabeLField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCardview()
        // Initialization code
    }

    fileprivate func setupCardview() {
        
        self.cardView.layer.cornerRadius = 4.0
        self.cardView.layer.borderWidth = 0.5
        self.cardView.layer.borderColor = UIColor.whiteTintColor(1.0).cgColor
        self.lastUpdateStrLabel.text = MyStrings.sharedInstance.LAST_UPDATE_WITH_COLON
        //let path : UIBezierPath = UIBezierPath(rect: self.cardView.bounds)
        //self.cardView.layer.shadowPath = path.cgPath
    }
    
    var repo:Repo? = nil {
        didSet {
            if let r = repo {
                self.repoNameLabel.text = r.name
                self.repoDescriptionLabel.text = r.description ?? MyStrings.sharedInstance.NOT_AVAILABLE
                
                self.lastUpdatedLabel.text = Scully.sharedInstance.TimeAgoTwitterStyle(r.updated_at)
                
            }
        }
    }
}
