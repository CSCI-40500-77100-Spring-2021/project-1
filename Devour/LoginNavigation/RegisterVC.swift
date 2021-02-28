//
//  RegisterVC.swift
//  Devour
//
//  Created by John Solano on 2/27/21.
//  Copyright © 2021 John Solano. All rights reserved.
//

import UIKit
import Firebase

var ref: DatabaseReference!

class RegisterVC: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var register: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        errorLabel.alpha = 0
    }
    
    // Missing checking if pass and confirm pass are the same
    @IBAction func registeredTapped(_ sender: Any) {
        let cleanedFirstName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedLastName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().createUser(withEmail: cleanedEmail, password: cleanedPassword) { authResult, error in
            if let error = error {
                self.showError("\(error.localizedDescription)") //Show error
            }
            else {
                // Add additional info to Realtime Database
                guard let userID = Auth.auth().currentUser?.uid else { return }
                ref = Database.database().reference()
                ref.child("users").child(userID).setValue([
                    "firstName" : cleanedFirstName,
                    "lastName" : cleanedLastName,
                    "email" : cleanedEmail
                    ])
                
                goToMainTabBarController()
            }
        }
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    /*
    @IBAction func testButtonTapped(_ sender: Any) {

        ref = Database.database().reference()
        
        ref.child("users").child("UserID").setValue(
        
        ["username": "username"]
        
        )
    }
    */
}
