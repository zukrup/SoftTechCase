//
//  RepoDetailViewController.swift
//  SoftCaseDemo
//
//  Created by musa fedakar on 18.08.2020.
//  Copyright © 2020 musa fedakar. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class RepoDetailViewController : BaseViewController {
    
    
    
    @IBOutlet weak var lastUpdatedLabel: MyUILabeLField!
    @IBOutlet weak var repoUrlLabel: MyUILabeLField!
    @IBOutlet weak var ownerNameLabel: MyUILabeLField!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var forksLabel: MyUILabeLField!
    @IBOutlet weak var issuesLabel: MyUILabeLField!
    @IBOutlet weak var watchersLabel: MyUILabeLField!
    
    
    @IBOutlet weak var descriptionLabel: MyUILabeLField!
    @IBOutlet weak var forkLabel: MyUILabeLField!
    @IBOutlet weak var defaultBranchLabel: MyUILabeLField!
    @IBOutlet weak var languageLabel: MyUILabeLField!
    
    var selectedRepo : Repo?
    
    override func viewDidLoad() {
       super.viewDidLoad()
       assignbackground()
       assignLayout()
           
    }
       
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        assignData()
    }

    func assignLayout() {
        self.ownerNameLabel.text = ""

        self.forkLabel.text = ""
        self.descriptionLabel.text = ""
        self.languageLabel.text = ""
        self.defaultBranchLabel.text = ""

        self.lastUpdatedLabel.text = ""
        
        self.issuesLabel.text = ""
        self.watchersLabel.text = ""
        self.repoUrlLabel.text = ""
        
        self.cardView.layer.cornerRadius = 6.0
        self.cardView.layer.borderWidth = 0.86
        self.cardView.layer.borderColor = UIColor.whiteTintColor(1.0).cgColor
         self.cardView.roundCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 6.0, borderColor: UIColor.GrayTintColor(220, alpha: 0.7), borderWidth: 0.65)
    }
    
    func assignData() {
        
        if let r = self.selectedRepo {
            
            self.title = r.name

            self.ownerNameLabel.text = r.owner?.login

            self.forkLabel.text = String(r.forks) + " " + "forks"
            self.descriptionLabel.text = "\"" + (r.description ?? MyStrings.sharedInstance.NOT_AVAILABLE) + "\""
            self.languageLabel.text = r.language
            self.defaultBranchLabel.text = r.default_branch

            if let avurl = r.owner?.avatar_url {
                self.avatarImageView.af.setImage(withURL: URL(string: avurl)!)
            }

            self.lastUpdatedLabel.text = Scully.sharedInstance.DateToDayMonthYearHourMinString(r.updated_at)
            
            self.issuesLabel.text = String(r.open_issues)
            self.watchersLabel.text = String(r.watchers_count)
            self.repoUrlLabel.text = r.html_url
            
        }
        
    }
    
    @IBAction func avatarBtnClick(_ sender: Any) {
        self.gotoProfileViewController()
    }
    
    
    @objc fileprivate func gotoProfileViewController() {
        
        if let data = self.selectedRepo?.owner {
            if let name = data.login {
                self.performSegue(withIdentifier: "show_user_profile_segue", sender: name)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "show_user_profile_segue":
            if let data = sender as? String, let vc = segue.destination as? ProfileViewController {
                vc.selectedProfile = data
            }
            break
        default:
            break
        }
    }
}
