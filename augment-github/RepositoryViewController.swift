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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
        fetchData()
    }
    
    func fetchData() {
        guard let repository = repository else { return }
        
        Repository.fetchRepository(withName: repository.name) { (repository) in
            self.repository?.size = repository?.size
            self.reloadData()
        }
        
        let attributes: [Repository.Attribute] = [.commits, .branches, .releases, .contributors]
        for attribute in attributes {
            Repository.fetch(numberOf: attribute, for: repository) { (nbAttribute) in
                self.repository?.nbCommits = attribute == .commits ? nbAttribute : self.repository?.nbCommits
                self.repository?.nbBranches = attribute == .branches ? nbAttribute : self.repository?.nbBranches
                self.repository?.nbReleases = attribute == .releases ? nbAttribute : self.repository?.nbReleases
                self.repository?.nbContributors = attribute == .contributors ? nbAttribute : self.repository?.nbContributors
                self.reloadData()
            }
        }
    }
    
    func reloadData() {
        guard let repository = repository else { return }
        nameLabel.text = repository.name
        descriptionLabel.text = repository.description
        sizeLabel.text = "\(repository.size?.fileSizeFormat ?? "")"
        commitsLabel.text = "\(repository.nbCommits?.formattedWithSeparator ?? "")"
        branchesLabel.text = "\(repository.nbBranches?.formattedWithSeparator ?? "")"
        releasesLabel.text = "\(repository.nbReleases?.formattedWithSeparator ?? "")"
        contributorsLabel.text = "\(repository.nbContributors?.formattedWithSeparator ?? "")"
    }
    
}

