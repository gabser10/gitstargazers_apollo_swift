//
//  String_Extension.swift
//  GitStargazers
//
//  Created by YLAPP on 26/01/2019.
//  Copyright © 2019 YLAPP. All rights reserved.
//

import Foundation
extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "")
    }
}
