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
    
    init?(fromJsonDict dict: NSDictionary) {
        return nil
    }
    
}
