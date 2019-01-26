//
//  LoginFormModel.swift
//  GitStargazers
//
//  Created by YLAPP on 17/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//

import UIKit
/**
 *Selection Repository's form.
    - selects Repository by the delegate GraphqlRepositoryDelegate
 */
class SearchFormView: UIView {
    @IBOutlet weak var ownerTextField: UITextField?
    @IBOutlet weak var repositoryTextField: UITextField?
    @IBOutlet weak var searchButton: UIButton?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    var delegate:SelectRepositoryDelegate?
    @IBOutlet var contentView: UIView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    /**
        Common initailization of view
     */
    func commonInit() {
        Bundle.main.loadNibNamed(Constants.xibIdentifier.SelectForm, owner: self, options: nil)
        addSubview(contentView ?? UIView())
        contentView?.frame = bounds
        contentView?.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        setUI()
        
    }
    ///
    func setUI() {
        repositoryTextField?.placeholder = LocalizableStruct.searchTextRepository.localized()
        ownerTextField?.placeholder = LocalizableStruct.searchTextOwner.localized()
        ownerTextField?.delegate = self
        repositoryTextField?.text = ""
        ownerTextField?.text = ""
        activityIndicator?.isHidden = true
    }
    
    @IBAction func touchView(_ sender: UITapGestureRecognizer) {
        self.endEditing(true)
    }
    /** Button search pressed in view
     call delagate method and update ui
     */
    @IBAction func searchAction(_ sender: UIButton) {
        startSearchUI()
        delegate?.selectRepositoryBy?(name: repositoryTextField?.text, owner: ownerTextField?.text,completion: {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                self.endSearchUI()
                self.setUI()
            }
        }, error: {
            self.endSearchUI()
            //managed by controller
        })
     
        self.endEditing(true)
    }
    /**
     
    */
    func startSearchUI() -> () {
        activityIndicator?.startAnimating()
        self.activityIndicator?.isHidden = false
         self.searchButton?.isEnabled = false
        
    }
    /**
     
     */
    func endSearchUI() -> () {
        self.activityIndicator?.stopAnimating()
        self.activityIndicator?.isHidden = true
       self.searchButton?.isEnabled = true
    }
    
}
extension SearchFormView:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.endEditing(true)
    }
}
