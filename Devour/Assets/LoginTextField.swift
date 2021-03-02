//
//  LoginTextField.swift
//  Devour
//
//  Created by John Solano on 3/2/21.
//  Copyright © 2021 John Solano. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 5
        layer.borderColor = UIColor(red: 64/255, green: 10/255, blue: 10/255, alpha: 1).cgColor
        layer.borderWidth = 1.0

        
    }
}
