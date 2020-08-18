//
//  ProfileViewController.swift
//  SoftCaseDemo
//
//  Created by musa fedakar on 18.08.2020.
//  Copyright © 2020 musa fedakar. All rights reserved.
//

import Foundation

class ProfileViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate let profile_cellIdentifier = "ProfileViewCell"
    fileprivate let repo_cellIdentifier = "UserRepoViewCell"
    
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           assignbackground()
           assignLayout()
           assignTableView()
       }
       
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func assignLayout() {

    }

    fileprivate func assignTableView() {

        self.mTableView.register(UINib(nibName: profile_cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)

        self.mTableView.register(UINib(nibName: repo_cellIdentifier, bundle: nil), forCellReuseIdentifier: pager_cellIdentifier)

        self.mTableView.dataSource = self
        self.mTableView.delegate = self

    }

        
        
}
