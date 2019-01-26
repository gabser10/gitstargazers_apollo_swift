//
//  ListStargazerViewController.swift
//  GitStargazers
//
//  Created by YLAPP on 20/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//

import UIKit
/**
    Lists Stargazers of selected repositories using data in DataManager static class.
 */
class ListStargazerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.estimatedRowHeight = UITableView.automaticDimension
        self.title = DataManager.shared.repository
   
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.stargazers.count
    }
 
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row >= DataManager.shared.stargazers.count - 1 {
            DataManager.shared.selectNextStargazers(completion: {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                    tableView.reloadData()
                })
            }, error: {_ in
            
            })
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "stargazerCell") as? StargazerTableViewCell
        {
           if let model = DataManager.shared.stargazers[indexPath.row]
           {
             cell.config(model: model)
          self.viewDidLayoutSubviews()
            
            }
            return cell
        }
        return UITableViewCell()
    }

}
