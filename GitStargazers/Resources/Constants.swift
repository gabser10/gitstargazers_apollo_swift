//
//  Constants.swift
//  GitStargazers
//
//  Created by YLAPP on 19/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//

import Foundation

class Constants {
    struct stubConstants
    {
        static let name = "Hello-World"
        static let owner = "octocat"
    }
    struct urlConstant
    {
        static let urlGraph = "https://api.github.com/graphql"
        static let schemaUrl = urlGraph + "/schema.json"
        static let access_token = "bearer 0ba3f4b1287761008c06ae8787d425758cd52201"
    }
    struct dispatchQueueLabel
    {
        static let fetchRepositoryQueue = "fetchRepositoryQueue"
    }
    struct xibIdentifier
    {
        static let SelectForm = "FindForm"
        static let StargazerView = "StargazerView"
    }
    enum Storyboard {
        case MasterViewController
    }
    struct segueIdentifier {
        static let toMaster = "toMaster"
        static let toMasterContainer = "toMasterContainer"
    }
    struct assetsName {
        static let catIcon = "catIcon"
    }
    
}
