import Foundation

class Repo : Decodable {
    
    dynamic var id = 0
    dynamic var name : String? = nil
    dynamic var full_name : String? = nil
    dynamic var description : String? = nil
    dynamic var language : String? = nil
    dynamic var html_url : String? = nil
    dynamic var pushed_at : Date = Date()
    dynamic var updated_at : Date = Date()
    dynamic var created_at : Date = Date()
    dynamic var forks = 0
    dynamic var open_issues = 0
    dynamic var watchers_count = 0
    dynamic var default_branch : String? = nil
    dynamic var score : Double = 0.0
        
    dynamic var owner : Owner?
    
    var cell_type : enRepoCellType = enRepoCellType.repo_object_cell
    
    enum CodingKeys: String, CodingKey {
        case id = "id", name = "name", full_name = "full_name", description = "description", language = "language", html_url = "html_url", updated_at = "updated_at",created_at = "created_at",pushed_at = "pushed_at", forks = "forks", watchers_count = "watchers_count", open_issues = "open_issues", default_branch = "default_branch", score = "score", owner = "owner"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String?.self, forKey: .description)
        
        self.description = try container.decode(String?.self, forKey: .description)
        self.language = try container.decode(String?.self, forKey: .language)
        self.html_url = try container.decode(String?.self, forKey: .description)
        self.default_branch = try container.decode(String?.self, forKey: .default_branch)
        
        self.forks = try container.decode(Int.self, forKey: .forks)
        self.watchers_count = try container.decode(Int.self, forKey: .watchers_count)
        self.open_issues = try container.decode(Int.self, forKey: .open_issues)
        
        if let scoreOpt = try container.decodeIfPresent(Double.self, forKey: .score) {
            self.score = scoreOpt
        }
        
        if let updatedAtStr = try container.decodeIfPresent(String.self, forKey: .updated_at) {
            self.updated_at = Scully.sharedInstance.isoStringToDate(updatedAtStr) ?? Date()
        }
        
        if let createdAtStr = try container.decodeIfPresent(String.self, forKey: .created_at) {
            self.created_at = Scully.sharedInstance.isoStringToDate(createdAtStr) ?? Date()
        }
        
        if let pushedAtstr = try container.decodeIfPresent(String.self, forKey: .pushed_at) {
            self.pushed_at = Scully.sharedInstance.isoStringToDate(pushedAtstr) ?? Date()
        }
        
        
        if let ownerObj = try container.decodeIfPresent(SoftCaseDemo.Owner.self, forKey: .owner) {
            self.owner = ownerObj
        }
        
        self.cell_type = enRepoCellType.repo_object_cell
         
    }
    
    
}
