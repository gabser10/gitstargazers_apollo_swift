//
//  DataManager.swift
//  GitStargazers
//
//  Created by YLAPP on 19/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//
// Data manager retrieving, mantains in memory and delete Repository and Owner's data
//

import Foundation
class DataManager: NSObject {
    static let shared:DataManager = DataManager()
    var stargazers:[RepoStargazer?] = []
    var owner:String?
    /// did set observer to empty cache when repository value change (Only in selectRepositoryBy.. method)
    var repository:String?{
        didSet {
            ApolloManager.emptyCache()
        }
    }
    
///Used to manage pendingRequest
    var pendingRequest:Bool = false
    /**
     Used to fetch eventually  first data and check if repository exìsts and if has stargazers
     - Parameter name: Repository name
     - Parameter owner: Owner name
     - Parameter completion: If fetch data send completion to caller
     - Parameter error: If error is present bridges directly errors to caller
     */
    func selectRepositoryBy(name:String?,owner:String?,completion:@escaping (()->Void),error:@escaping ((NSError)->Void))
    {
      
        ApolloManager.selectRepositoryBy(name: name, owner: owner, completion: { (result)  in
/// Compact to escape repeated elements
            self.owner = owner
            self.repository = name
            var flatMap = self.stargazers.compactMap({$0?.id})
            let res1 = result.compactMap({$0?.id})
            
            var newVal:[RepoStargazer] = []
            flatMap.append(contentsOf: res1)
            for id in flatMap
            {
               if let single = self.stargazers.filter({$0?.id == id}).first as? RepoStargazer
               {
                newVal.append(single)
               }else if let single = result.filter({$0?.id == id}).first as? RepoStargazer{
                 newVal.append(single)
                }
            }
            self.stargazers = newVal
            completion()
        }, errorHandler:error)
        
    }
    /**
     Used to fetch data from last cursor of previous calls
     - Parameter completion: If fetch data send to caller an empty completion
     - Parameter error: If error is present bridges directly errors to caller
     */
    func selectNextStargazers(completion:@escaping (()->Void),error:@escaping ((NSError)->Void))
    {
        if !pendingRequest
        {
            ApolloManager.nextStargazers(completion: { (response) in
                  DataManager.shared.stargazers.append(contentsOf: response)
                self.compactStargazersData(arr: self.stargazers)
                completion()
                self.pendingRequest = false
            }, errorHandler: error)
        }
    }
}
extension DataManager{
//    Deletes ripetute elements
    func compactStargazersData(arr:[RepoStargazer?])
    {
        let compactMap = self.stargazers.compactMap({$0?.id})
        let stargazers = self.stargazers.filter({ if let id = $0?.id {  return compactMap.contains(id)  }else {return false}   })
        self.stargazers = stargazers
    }
}
