//
//  MgnResponse.swift
//  BaylanMgn
//
//  Created by musa fedakar on 12.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation

class RepoResponse {
    
    public init() {
        self.total_count = 0
        self.incomplete_results = false
        self.isSucceeded = false
    }
    
    var total_count : Int
    var incomplete_results : Bool
    var isSucceeded: Bool
}

class RepoResponseObject<Codable> : RepoResponse {
    
    override init() {
       super.init()
    }
    
    var item : Decodable? = nil
    
    init(object: Decodable) {
        super.init()
        self.item = object
    }
    
}

class RepoResponseObjectList<Codable> : RepoResponse {
    
    override init() {
       super.init()
    }
    
    var items : [Decodable] = []
    
    
    init(json: JSON, objectList: [Decodable]) {
        super.init()
        self.total_count = json["total_count"].intValue
        self.items = objectList
    }
    
    init(objectList: [Decodable]) {
        super.init()
        self.items = objectList
    }
    
}

