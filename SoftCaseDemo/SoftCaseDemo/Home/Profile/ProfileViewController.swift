//
//  ProfileViewController.swift
//  SoftCaseDemo
//
//  Created by musa fedakar on 18.08.2020.
//  Copyright © 2020 musa fedakar. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate let profile_cellIdentifier = "ProfileViewCell"
    fileprivate let repo_cellIdentifier = "UserRepoViewCell"
    
    @IBOutlet weak var mTableView: UITableView!
    
    var mProfileDataset : [profileViewRow] = []
    var selectedProfile : String?
    
    override func viewDidLoad() {
           super.viewDidLoad()
           assignbackground()
           assignLayout()
           assignTableView()
       }
       
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dispatch_on_main {
            Prog.start(in: self.progressParent, .bar(self.barParam))
        }
        getUser()
        getUserRepoList()
    }

    func assignLayout() {

    }

    @IBOutlet weak var progressAnchor: UIView!
    
    fileprivate var progressParent: ProgressParent {
        return self.progressAnchor as ProgressParent
    }
    
    let barParam: BarProgressorParameter = (.endless, BarProgressorSide.top, UIColor.sinRedLight(0.65), 3)
    
    
    fileprivate func assignTableView() {

        self.mTableView.register(UINib(nibName: profile_cellIdentifier, bundle: nil), forCellReuseIdentifier: profile_cellIdentifier)

        self.mTableView.register(UINib(nibName: repo_cellIdentifier, bundle: nil), forCellReuseIdentifier: repo_cellIdentifier)
        self.mTableView.rowHeight = UITableView.automaticDimension
        self.mTableView.estimatedRowHeight = 300
        self.mTableView.dataSource = self
        self.mTableView.delegate = self

    }

    func getUser() {
         sendApiRequestToDevice(buildGetUserCommand())
    }
    
    func buildGetUserCommand() -> ApiRequestCommand {
        let retval = ApiRequestCommand(ct: .get_user)
        let queryobject = BaseRequest()
        queryobject.QueryString = self.selectedProfile ?? MyStrings.sharedInstance.NOT_AVAILABLE
        retval.queryObject = queryobject
        return retval
    }
    
    func getUserRepoList() {
       
        sendApiRequestToDevice(buildGetUserRepoListCommand())
    }
   
    func buildGetUserRepoListCommand() -> ApiRequestCommand {
        let retval = ApiRequestCommand(ct: .get_user_repos)
        let queryobject = BaseRequest()
        queryobject.QueryString = self.selectedProfile ?? MyStrings.sharedInstance.NOT_AVAILABLE
        retval.queryObject = queryobject
        return retval
    }
    var api_reponse_counter = 2
    override func api_operation_completed(_ ApiRequestCommand: ApiRequestCommand?) {
        api_reponse_counter -= 1
        if (api_reponse_counter == 0) {
            dispatch_on_main {
                Prog.end(in: self.progressParent)
            }
        }
        
        
        if let apiRequestCommand = ApiRequestCommand {
            if (checkApiResponse(command: apiRequestCommand)) {
                return
            }
            switch apiRequestCommand.apiCommandType! {
            case ApiRequestCommandType.get_user:
                getUserCallback(ApiRequestCommand?.returnObject as! RepoResponseObject<Owner>)
                break
            case ApiRequestCommandType.get_user_repos:
                getUserRepoListCallback(ApiRequestCommand?.returnObject as! RepoResponseObjectList<Repo>)
                break
            default:
                break
            }
        }
    }
    
    fileprivate func getUserCallback(_ response : RepoResponseObject<Owner>) {
        
        if let data = response.item as? Owner {
            self.mProfileDataset.insert(contentsOf: [profileViewRow(o: data)], at: 0)
            dispatch_on_main {
                self.mTableView.reloadData()
            }
        }
        
       
    }
    
    
    fileprivate func getUserRepoListCallback(_ response : RepoResponseObjectList<Repo>) {
        
        if let dataset = response.items as? [Repo] {
            //for item in dataset.sorted(by: { $0.LastEditDate < $1.LastEditDate } ) {
            
            
            for item in dataset {
                self.mProfileDataset.append(profileViewRow(r: item))
            }
            
            dispatch_on_main {
                self.mTableView.reloadData()
            }
            
        }
       
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.mProfileDataset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let data = self.mProfileDataset[indexPath.row] as profileViewRow
        
        switch data.rowType {
        case .profile:
            let cell = self.mTableView.dequeueReusableCell(withIdentifier: self.profile_cellIdentifier, for: indexPath) as! ProfileViewCell
            
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.clear
            cell.contentView.backgroundColor = UIColor.clear
            cell.layer.backgroundColor = UIColor.clear.cgColor
            cell.owner = data.owner
            return cell
        case .repo:
            let cell = self.mTableView.dequeueReusableCell(withIdentifier: self.repo_cellIdentifier, for: indexPath) as! UserRepoViewCell
            
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.clear
            cell.contentView.backgroundColor = UIColor.clear
            cell.layer.backgroundColor = UIColor.clear.cgColor
            cell.repo = data.repo
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 192.0
        }
        else {
            return 92.0
        }
    }
    
    
    struct profileViewRow {
        var rowType : profileViewRowType
        var owner: Owner?
        var repo: Repo?
        
        init(o: Owner) {
            self.rowType = profileViewRowType.profile
            self.owner = o
        }
        
        init(r: Repo) {
            self.rowType = profileViewRowType.repo
            self.repo = r
        }
    }
    
    enum profileViewRowType {
        case profile
        case repo
    }
        
}
