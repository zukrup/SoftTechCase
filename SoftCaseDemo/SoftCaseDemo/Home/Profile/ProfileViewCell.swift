//
//  ProfileViewCell.swift
//  SoftCaseDemo
//
//  Created by musa fedakar on 18.08.2020.
//  Copyright © 2020 musa fedakar. All rights reserved.
//

import UIKit
import AlamofireImage
class ProfileViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: MyUILabeLField!
    @IBOutlet weak var fullnameLabel: MyUILabeLField!
    @IBOutlet weak var emailLabel: MyUILabeLField!
    @IBOutlet weak var companyLabel: MyUILabeLField!
    @IBOutlet weak var blogAddressLabel: MyUILabeLField!
    @IBOutlet weak var summaryLabel: MyUILabeLField!
    
    @IBOutlet weak var bioLabel: MyUILabeLField!
    @IBOutlet weak var avatarImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    var owner:Owner? = nil {
        didSet {
            if let o = owner {
                self.usernameLabel.text = o.login
                self.fullnameLabel.text = o.name
                self.emailLabel.text = o.email ?? MyStrings.sharedInstance.NOT_AVAILABLE
                if let avurl = o.avatar_url {
                    self.avatarImageView.af.setImage(withURL: URL(string: avurl)!, filter:CircleFilter())
                }
                self.companyLabel.text = o.company ?? MyStrings.sharedInstance.NOT_AVAILABLE
                self.blogAddressLabel.text = o.blog ?? MyStrings.sharedInstance.NOT_AVAILABLE
                
                let summary : String = String(o.followers ) + " " + MyStrings.sharedInstance.FOLLOWERS + " " + String(o.public_repos ?? 0) + " " + MyStrings.sharedInstance.PUBLIC_REPOS
                
                self.summaryLabel.text = summary
                
                let location : String = o.location ?? ""
                let bio = location + "\n" + (o.bio ?? MyStrings.sharedInstance.BIO_NOT_AVAILABLE)
                self.bioLabel.text = bio
            }
        }
    }
    
}
