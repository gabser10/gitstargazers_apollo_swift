//
//  SelectUserViewController.swift
//  GitStargazers
//
//  Created by YLAPP on 17/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//

import UIKit
@objc protocol SelectRepositoryDelegate {
    @objc optional func selectRepositoryBy(name:String?,owner:String?,completion:@escaping ()->(),error:@escaping (()->()))
    func endEditing()
}
/**
 *  SelectRepositoryBy DataManager
    - present ListStargazersViewController if will obtain stargazers for selected repositories
 */
class SelectRepositoryViewController: GitStargazersViewController
{
    @IBOutlet weak var searchForm: SearchFormView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchForm?.delegate = self
        self.title = "select_repository".localized()
    }
    /**
        RESET STATIC DATA SOURCE TO START ANOTHER SEARCH
 
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataManager.shared.stargazers = []
    }
    /**
            Reset of UI fields
     */
    func resetUI()
    {
        self.searchForm?.repositoryTextField?.text = ""
        self.searchForm?.ownerTextField?.text = ""
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ListStargazerViewController
        {
            resetUI()
            controller.title = self.searchForm?.repositoryTextField?.text
            controller.navigationController?.title = self.searchForm?.repositoryTextField?.text
        }
    }
}

extension SelectRepositoryViewController:SelectRepositoryDelegate
{
    func endEditing() {
        self.view.endEditing(true)
    }
    /**
            Used to fetch data and check if repository exìsts and
            - Parameter name: Repository name
            - Parameter owner: Owner name
     
            - Returns: if has stargazers perform the segue to ListStargazerViewController
            else if there are errors presents an alert controller. the error message is taken from userInfo Dictionary
     
     */
    
    @objc func selectRepositoryBy(name:String?,owner:String?,completion:@escaping ()->(),error errorHandler:@escaping (()->()))
    {
        DataManager.shared.selectRepositoryBy(name: name, owner: owner, completion: {
           
            DispatchQueue.main.async {
            completion()
                self.performSegue(withIdentifier: Constants.segueIdentifier.toMaster, sender: self)
            }
         return
        }, error: {
            (error) in
                   DispatchQueue.main.async {
            self.presentAlertController(title: error.userInfo["title"] as! String, message: error.domain)
                        errorHandler()
            }
        })
    }
    
}
