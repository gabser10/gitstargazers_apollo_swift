//
//  StargazerTableViewCell.swift
//  GitStargazers
//
//  Created by YLAPP on 20/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//

import UIKit
import SDWebImage
class StargazerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stargazersView: StargazerView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    /**
        Config view by data model
     */
    func config(model:RepoStargazer)
    {
     self.stargazersView?.bioValue?.text = model.bio
        self.stargazersView?.nameValue?.text = model.name
        if let url = URL(string: model.urlAvatar ?? "")
        {
            self.stargazersView?.avatarImage?.sd_setImage(with: url, placeholderImage: UIImage(named: Constants.assetsName.catIcon), options: [], completed: nil)

        }
              layoutIfNeeded()
        layoutSubviews()
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }

}
