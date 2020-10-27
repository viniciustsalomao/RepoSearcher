//
//  RepositorieTableViewCell.swift
//  GitHubRepoSearcher
//
//  Created by Vinícius Tinajero Salomão on 26/10/20.
//

import UIKit

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
        lbUser.text = repository.owner.login
        lbStars.text = String(repository.stargazers_count)
        lbLanguage.text = repository.language
        
        do {
            guard let url = URL(string: repository.html_url) else { return }
            let data = try Data(contentsOf: url)
            ivAvatar.image = UIImage(data: data)
        }
        catch{
            print(error)
        }
    }
    
}
