//
//  GitStargazersViewControlloreViewController.swift
//  GitStargazers
//
//  Created by YLAPP on 20/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//

import UIKit

class GitStargazersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func presentAlertController (title:String,message:String?)
    {
        let controller = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: { (action) in
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }))
        DispatchQueue.main.async {
            self.present(controller, animated: true, completion: nil)
        }
    }
}

