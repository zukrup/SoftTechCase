//
//  ViewController.swift
//  SoftCaseDemo
//
//  Created by musa fedakar on 17.08.2020.
//  Copyright © 2020 musa fedakar. All rights reserved.
//

import UIKit

class RepoViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {

    let searchController = UISearchController(searchResultsController: nil)
    
    
    fileprivate let cellIdentifier = "RepoViewCell"
    fileprivate let pager_cellIdentifier = "PagerViewCell"
    
    @IBOutlet weak var mTableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    fileprivate var mRepoList : [Repo] = [Repo]()
    
    
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
        
        self.refreshControl.addTarget(self, action: #selector(refreshAllItemData(_:)), for: .valueChanged)

        self.refreshControl.tintColor = UIColor.sinRedLight(1.0)

        if #available(iOS 10.0, *) {
        self.mTableView.refreshControl = refreshControl
        } else {
        self.mTableView.addSubview(refreshControl)
        }

        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false

        searchController.searchBar.placeholder = MyStrings.sharedInstance.SEARCH_REPOSITORIES

        definesPresentationContext = true
        self.mTableView.tableHeaderView = searchController.searchBar

        self.mTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        self.mTableView.register(UINib(nibName: pager_cellIdentifier, bundle: nil), forCellReuseIdentifier: pager_cellIdentifier)
        
        self.mTableView.dataSource = self
        self.mTableView.delegate = self
        
    }
    
    @IBOutlet weak var progressAnchor: UIView!
    
    fileprivate var progressParent: ProgressParent {
        return self.progressAnchor as ProgressParent
    }
    
    let barParam: BarProgressorParameter = (.endless, BarProgressorSide.top, UIColor.sinRedLight(0.65), 3)
    
    @objc private func refreshAllItemData(_ sender: Any) {
        
        self.totalCount = 0
        self.currentPage = 1
        
        dispatch_on_main {
            self.mTableView.reloadData()
            self.refreshControl.endRefreshing()
            Prog.start(in: self.progressParent, .bar(self.barParam))
        }
        
        if let query = self.searchController.searchBar.text {
            if !query.isEmpty {
                getRepoList(query: query)
            }
            else {
                self.mRepoList = []
                 dispatch_on_main {
                    self.mTableView.reloadData()
                    Prog.end(in: self.progressParent)
                }
            }
        }
        else {
            self.mRepoList = []
            dispatch_on_main {
               self.mTableView.reloadData()
               Prog.end(in: self.progressParent)
           }
        }
    }

    func  getRepoList(query: String) {
        dispatch_on_main {
            Prog.start(in: self.progressParent, .bar(self.barParam))
        }
        sendApiRequestToDevice(buildGetRepoListCommand(query: query))
    }
    
    var currentPage : Int = 1
    let pageSize : Int = 20
    var totalCount : Int = 0
    var queryString : String = ""
    func buildGetRepoListCommand(query: String) -> ApiRequestCommand {
        let retval = ApiRequestCommand(ct: .get_repos)
        let queryobject = BaseRequest()
        queryobject.Page = currentPage
        queryobject.PageSize = pageSize
        queryobject.QueryString = query
        retval.queryObject = queryobject
        return retval
    }
    
    override func api_operation_completed(_ ApiRequestCommand: ApiRequestCommand?) {
        
        dispatch_on_main {
            Prog.end(in: self.progressParent)
            self.searchController.searchBar.isUserInteractionEnabled = true
        }
        if let apiRequestCommand = ApiRequestCommand {
            
            if (checkApiResponse(command: apiRequestCommand)) {
                return
            }
            
            switch apiRequestCommand.apiCommandType! {
            case ApiRequestCommandType.get_repos:
                getOrderListCallback(ApiRequestCommand?.returnObject as! RepoResponseObjectList<Repo>)
                break
            default:
                break
            }
        }
    }
    
    fileprivate func getOrderListCallback(_ response : RepoResponseObjectList<Repo>) {
        
        self.totalCount = response.total_count
        
        if let dataset = response.items as? [Repo] {
            //for item in dataset.sorted(by: { $0.LastEditDate < $1.LastEditDate } ) {
            
            if let lastRecord = self.mRepoList.last {
                switch lastRecord.cell_type {
                case .pager_cell:
                    self.mRepoList.removeLast()
                    break
                default:
                    break
                }
            }
            
            for var item in dataset {
                mRepoList.append(item)
            }
            
            if (response.total_count - mRepoList.count > 0) {
                let repo = Repo()
                repo.cell_type = enRepoCellType.pager_cell
                mRepoList.append(repo)
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
        
        return self.mRepoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let data = self.mRepoList[indexPath.row] as Repo
        
        switch data.cell_type {
        case .repo_object_cell:
            let cell = self.mTableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! RepoViewCell
            
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.clear
            cell.contentView.backgroundColor = UIColor.clear
            cell.layer.backgroundColor = UIColor.clear.cgColor
            cell.repo = data
            
            cell.avatarImageViewBtn?.indexPath = indexPath
            cell.avatarImageViewBtn?.addTarget(self, action: #selector(self.gotoProfileViewController(_:)), for: .touchUpInside)
            
            return cell
        default:
            let cell = self.mTableView.dequeueReusableCell(withIdentifier: self.pager_cellIdentifier, for: indexPath) as! PagerViewCell
            
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.clear
            cell.contentView.backgroundColor = UIColor.clear
            cell.layer.backgroundColor = UIColor.clear.cgColor
            
            let p_ = PagerObj(total: self.totalCount, page: self.currentPage, pSize: self.pageSize, records: self.mRepoList.count)
            cell.pagerObj = p_
            cell.pagerStateBtn?.isUserInteractionEnabled = true
            cell.pagerStateBtn?.indexPath = indexPath
            cell.pagerStateBtn?.addTarget(self, action: #selector(RepoViewController.getNext(_:)), for: .touchUpInside)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let _ as RepoViewCell = tableView.cellForRow(at: indexPath) else {
            return
        }
        let data = self.mRepoList[indexPath.row] as Repo
        gotoRepoDetailViewController(data: data)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84.0
    }
    
    @objc func getNext(_ sender: MyCellInfoButton) {
        
        currentPage += 1
        sender.isUserInteractionEnabled = false
        self.getRepoList(query: self.queryString)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    var timer : Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if let _ = self.timer {
            timer!.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(self.reload), userInfo: searchText, repeats: false)

    }
    
    
    @objc func reload() {
        timer!.invalidate()
        guard let searchText = self.searchController.searchBar.text else {
            return
        }
        if let query = self.searchController.searchBar.text {
            if !query.isEmpty {
                dispatch_on_main {
                    self.searchController.searchBar.isUserInteractionEnabled = false
                }
                self.mRepoList = []
                self.queryString = query
                self.getRepoList(query: query)
            }
        }
    }
    
    @objc fileprivate func gotoProfileViewController(_ sender: MyCellInfoButton) {
        
        if let indexPath = sender.indexPath, let data = self.mRepoList.get(indexPath.row) {
            if let name = data.owner?.login {
                self.performSegue(withIdentifier: "show_user_profile_segue", sender: name)
            }
        }
    }
    
    fileprivate func gotoRepoDetailViewController(data: Repo) {
        
        self.performSegue(withIdentifier: "show_repo_detail_segue", sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "show_user_profile_segue":
            if let data = sender as? String, let vc = segue.destination as? ProfileViewController {
                vc.selectedProfile = data
            }
            break
        case "show_repo_detail_segue":
            if let data = sender as? Repo, let vc = segue.destination as? RepoDetailViewController {
                vc.selectedRepo = data
            }
        default:
            break
        }
    }
    
}

