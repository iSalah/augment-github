//
//  Repository+Services.swift
//  augment-github
//
//  Created by Salah on 2017-10-01.
//  Copyright © 2017 DevSK. All rights reserved.
//

import Foundation
import Alamofire

extension Repository {
    
    enum Attribute {
        case branches
        case releases
        case commits
        case contributors
        
        var url: String {
            switch self {
            case .branches: return "branches"
            case .releases: return "releases"
            case .commits: return "commits"
            case .contributors: return "contributors"
            }
        }
    }
    
    class func fetchPublicRepositories(sinceRepository: Repository?, callback: @escaping ([Repository]) -> ()) {
        let sinceParameter = sinceRepository != nil ? "?since=\(sinceRepository!.id)" : ""
        let url = "https://api.github.com/repositories\(sinceParameter)"
        
        Alamofire.request(url).responseJSON { response in
            guard let jsonRepositories = response.result.value as? NSArray else { return callback([]) }
            var repositories = [Repository]()
            for jsonRepository in jsonRepositories {
                if let repositoryDict = jsonRepository as? NSDictionary, let repository = Repository(fromDict: repositoryDict) {
                    repositories.append(repository)
                }
            }
            
            callback(repositories)
        }
    }
    
    class func fetchRepository(withName name: String, callback: @escaping (Repository?) -> ()) {
        let url = "https://api.github.com/repos/\(name)"
        Alamofire.request(url).responseJSON { response in
            guard let jsonRepository = response.result.value as? NSDictionary else { return callback(nil) }
            callback(Repository(fromDict: jsonRepository))
        }
    }
    
    class func fetch(numberOf attribute: Attribute, for repository: Repository, callback: @escaping (Int) -> ()) {
        let url = "https://api.github.com/repos/\(repository.name)/\(attribute.url)?per_page=1"
        Alamofire.request(url).responseJSON { response in
            guard let link = response.response?.allHeaderFields["Link"] as? String else { return callback(0) }
            let match = link.findMatch(pattern: ".*page=([0-9]+)>; ?rel=\"last.*")
            let ret = Int(match ?? "0") ?? 0
            callback(ret)
        }
    }

}
