//
//  Enum.swift
//  SoftCaseDemo
//
//  Created by musa fedakar on 17.08.2020.
//  Copyright © 2020 musa fedakar. All rights reserved.
//

import Foundation

public enum enResultCode : Int
{
    case succeeded
    case failed
    case undefined
    case connectionStringCouldNotFound
    case dbConnectionTestHasFailed
    case accountClosed
    case noPermission
}


public enum ApiRequestCommandType {
    case get_repos
    case get_user
    case get_user_repos
     
}

public enum ApiRequestResponseState {
    case success
    case error
    case unknown
    case timeout
}

public enum enRepoCellType {
    case repo_object_cell
    case pager_cell
}
