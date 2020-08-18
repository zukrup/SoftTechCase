//
//  UserDTO.swift
//  BaylanMgn
//
//  Created by musa fedakar on 10.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation

class Owner: Decodable {
    
    
    dynamic var id = 0
    dynamic var login : String? = nil
    dynamic var avatar_url : String? = nil
    dynamic var gravatar_id : String? = nil
    dynamic var html_url : String? = nil
    dynamic var name : String? = nil
    dynamic var company : String? = nil
    dynamic var blog : String? = nil
    dynamic var location : String? = nil
    dynamic var email : String? = nil
    dynamic var twitter_username : String? = nil
    dynamic var public_repos : Int = 0
    dynamic var followers : Int = 0
    dynamic var following : Int = 0
    dynamic var bio : String? = nil
    
    enum CodingKeys: String, CodingKey {
        case id = "id", login = "login", avatar_url = "avatar_url", gravatar_id = "gravatar_id", html_url = "html_url", name = "name", company = "company", blog = "blog", location = "location", email = "email", twitter_username = "twitter_username", public_repos = "public_repos", followers = "followers",following = "following", bio = "bio"
    }
    
    required convenience init(from decoder: Decoder) throws {
        
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        
        if let name_opt = try container.decodeIfPresent(String?.self, forKey: .name) {
            self.name = name_opt
        }
        
        if let company_opt = try container.decodeIfPresent(String?.self, forKey: .company) {
            self.company = company_opt
        }
        
        if let bio_opt = try container.decodeIfPresent(String?.self, forKey: .bio) {
            self.bio = bio_opt
        }
        
        if let blog_opt = try container.decodeIfPresent(String?.self, forKey: .blog) {
            self.blog = blog_opt
        }
        
        self.login = try container.decode(String?.self, forKey: .login)

        self.avatar_url = try container.decode(String?.self, forKey: .avatar_url)
        self.gravatar_id = try container.decode(String?.self, forKey: .gravatar_id)
       
        self.html_url = try container.decode(String?.self, forKey: .html_url)
        
        if let twitter_username_opt = try container.decodeIfPresent(String?.self, forKey: .twitter_username) {
            self.twitter_username = twitter_username_opt
        }
        
        if let public_repos_opt = try container.decodeIfPresent(Int.self, forKey: .public_repos) {
            self.public_repos = public_repos_opt
        }
        
        if let followers_opt = try container.decodeIfPresent(Int.self, forKey: .followers) {
            self.followers = followers_opt
        }
        if let following_opt = try container.decodeIfPresent(Int.self, forKey: .following) {
            self.following = following_opt
        }
        
 
        
    }
    
    
}
