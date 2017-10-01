//
//  RepositoryCell.swift
//  augment-github
//
//  Created by Salah on 2017-10-01.
//  Copyright © 2017 DevSK. All rights reserved.
//

import Foundation
import UIKit

class RepositoryCell: UITableViewCell {
    
    static let identifier = "RepositoryCellIdentifier"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configCell(repository: Repository) {
        titleLabel.text = repository.name
        descriptionLabel.text = repository.description
    }
}
