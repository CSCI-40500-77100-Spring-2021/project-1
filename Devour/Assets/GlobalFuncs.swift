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

func printFonts() {
    for familyName in UIFont.familyNames {
        print("\n-- \(familyName) \n")
        for fontName in UIFont.fontNames(forFamilyName: familyName) {
            print(fontName)
        }
    }
    //Stick-Regular
}

// The follow code adds gradient views to the story board

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }

    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map {$0.cgColor}
        if (isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0.5, y: 0.1)
            layer.endPoint = CGPoint(x: 0.5, y: 0.4)
        }
    }
    
}
