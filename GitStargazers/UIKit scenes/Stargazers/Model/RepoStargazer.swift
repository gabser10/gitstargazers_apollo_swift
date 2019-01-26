//
//  RepoStargazer.swift
//  GitStargazers
//
//  Created by YLAPP on 19/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//

import Foundation
class RepoStargazer:Codable {
    var name:String?
    var urlAvatar:String?
    var bio:String?
    var id:String?
    init(name:String?,urlAvatar:String?,bio:String?,id:String?)
    {
        self.name = name
        self.urlAvatar = urlAvatar
        self.bio = bio
        self.id = id
    }
    
}
