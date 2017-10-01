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
    
}
