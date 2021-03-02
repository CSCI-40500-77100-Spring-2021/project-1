//
//  LoginVC.swift
//  Devour
//
//  Created by John Solano on 2/27/21.
//  Copyright © 2021 John Solano. All rights reserved.
//

import UIKit
import Firebase


/*
 Colors
 #BF1D1D    #801313     #FF2525
 #400A0A    #E62222
 */
class LoginVC: UIViewController {

    @IBOutlet weak var bgGradientView: UIView!
    //@IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var Register: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // do not show error label
        ErrorLabel.alpha = 0
        
        // Title
        //TitleLbl.font = UIFont(name: "Stick-Regular", size: 30)
        //Gradient bg
        // Create a gradient layer.
        /*
        let gradientLayer = CAGradientLayer()
        // Set the size of the layer to be equal to size of the display.
        gradientLayer.frame = view.bounds
        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
        // This example uses a Color Literal and a UIColor from RGB values.
        gradientLayer.colors = [
            UIColor(red: 64/255, green: 10/255, blue: 10/255, alpha: 1).cgColor,
            UIColor(red: 255/255, green: 37/255, blue: 37/255, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.4)
        bgGradientView.layer.addSublayer(gradientLayer)
 */
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
