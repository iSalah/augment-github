//
//  RepositoriesViewController.swift
//  augment-github
//
//  Created by Salah on 2017-10-01.
//  Copyright © 2017 DevSK. All rights reserved.
//

import UIKit

class RepositoriesViewController: UITableViewController {

    var repositories = [Repository]()
    var shouldLoadMoreRepositories = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        Repository.fetchPublicRepositories(sinceRepository: repositories.last) { (repositories) in
            self.shouldLoadMoreRepositories = repositories.count > 0 ? true : false
            self.repositories += repositories
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count + (shouldLoadMoreRepositories ? 1 : 0)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if shouldLoadMoreRepositories && indexPath.row == repositories.count {
            fetchData()
            return tableView.dequeueReusableCell(withIdentifier: "LoadingCell")!
        }
        
        let repository = repositories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCell.identifier) as! RepositoryCell
        cell.configCell(repository: repository)
        return cell
    }

}

