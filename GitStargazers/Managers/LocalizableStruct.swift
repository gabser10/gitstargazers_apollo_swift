//
//  LocalizableStruct.swift
//  GitStargazers
//
//  Created by YLAPP on 17/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//

import Foundation
struct LocalizableStruct {
    static var searchTextButton =  "search".localizedCapitalized.localized()
    static var searchTextRepository =  NSLocalizedString("insert_github_repository_name_you_want", comment: "").localized()
    static var searchTextOwner = NSLocalizedString("insert_owner", comment: "").localized()
    
    struct Error {
        static var repositoryNotFound = NSLocalizedString("repository_not_found", comment: "").localized()
        static var endStargazers = NSLocalizedString("end_of_stargazers_for_the_repo",comment: "").localized()
    }
    
}
