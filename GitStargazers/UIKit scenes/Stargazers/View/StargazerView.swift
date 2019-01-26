//
//  StargazerView.swift
//  GitStargazers
//
//  Created by YLAPP on 20/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//

import UIKit

class StargazerView: UIView {

    @IBOutlet var contentView: UIView?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit()
    {
        Bundle.main.loadNibNamed(Constants.xibIdentifier.StargazerView, owner: self, options: nil)
        addSubview(contentView ?? UIView())
        
        contentView?.frame = self.bounds
        contentView?.autoresizingMask = [.flexibleWidth,.flexibleHeight]
     
    }
    @IBOutlet weak var avatarImage: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var nameValue: UILabel?
    @IBOutlet weak var bioValue: UILabel?
    
    
}
