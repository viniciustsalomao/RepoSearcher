//
//  RepositorieTableViewCell.swift
//  GitHubRepoSearcher
//
//  Created by Vinícius Tinajero Salomão on 26/10/20.
//

import UIKit
import Kingfisher

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbUser: UILabel!
    @IBOutlet weak var lbStars: UILabel!
    @IBOutlet weak var lbLanguage: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with repository: Repository) {
        lbName.text = repository.name
        lbUser.text = repository.owner?.login
        lbStars.text = String(repository.stargazers_count!)
        lbLanguage.text = repository.language
        
        if let url = URL(string: (repository.owner?.avatar_url)!) {
            ivAvatar.kf.indicatorType = .activity
            ivAvatar.kf.setImage(with: url)
        } else {
            ivAvatar.image = nil
        }
        
    }
    
}
