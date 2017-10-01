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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        Repository.fetchPublicRepositories(sinceRepository: repositories.last) { (repositories) in
            self.repositories += repositories
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repository = repositories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCell.identifier) as! RepositoryCell
        cell.configCell(repository: repository)
        return cell
    }

}

