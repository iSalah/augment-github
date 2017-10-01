//
//  Repository.swift
//  augment-github
//
//  Created by Salah on 2017-10-01.
//  Copyright © 2017 DevSK. All rights reserved.
//

import Foundation

class Repository {
    
    var id: Int
    var name: String
    var description: String
    var size: Double?
    var nbBranches: Int?
    var nbReleases: Int?
    var nbCommits: Int?
    var nbContributors: Int?
    
    init?(fromDict dict: NSDictionary) {
        guard let id = dict.value(forKey: "id") as? Int else { return nil }
        guard let name = dict.value(forKey: "full_name") as? String else { return nil }
        guard let description = dict.value(forKey: "description") as? String else { return nil }
        self.id = id
        self.name = name
        self.description = description
    }
    
}
