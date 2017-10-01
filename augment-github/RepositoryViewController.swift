//
//  RepositoryViewController.swift
//  augment-github
//
//  Created by Salah on 2017-10-01.
//  Copyright © 2017 DevSK. All rights reserved.
//

import UIKit

class RepositoryViewController: UITableViewController {
    
    var repository: Repository?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var branchesLabel: UILabel!
    @IBOutlet weak var releasesLabel: UILabel!
    @IBOutlet weak var commitsLabel: UILabel!
    @IBOutlet weak var contributorsLabel: UILabel!
    
}

