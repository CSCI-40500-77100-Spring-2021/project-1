//
//  GlobalFuncs.swift
//  Devour
//
//  Created by John Solano on 2/28/21.
//  Copyright © 2021 John Solano. All rights reserved.
//

import Foundation
import UIKit
import Firebase

func goToMainTabBarController(){
   // Reference to Story Board
   let storyboard = UIStoryboard(name: "Main", bundle: nil)
   let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
    // Go to home page
    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
}

