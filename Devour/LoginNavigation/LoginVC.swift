//
//  LoginVC.swift
//  Devour
//
//  Created by John Solano on 2/27/21.
//  Copyright © 2021 John Solano. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var Register: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // do not show error label
        ErrorLabel.alpha = 0
    }
    

    @IBAction func LoginTapped(_ sender: Any) {
        print("Login Tapped") // Debugging purposes
        // Create clean fields & parse text from text boxes
        let cleanEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // Reference to Story Board
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        //Sign in the user
        Auth.auth().signIn(withEmail: cleanEmail, password: cleanPassword) { (result, error) in
            if let error = error {
                self.showError("\(error.localizedDescription)")
            }
            else{
                // This is to get the SceneDelegate object from your view controller
                // then call the change root view controller function to change to main tab bar
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
            }
        } // end of sign in
    }
    
    func showError(_ message:String){
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
}
