//
//  LoginNavController.swift
//  Devour
//
//  Created by John Solano on 2/27/21.
//  Copyright © 2021 John Solano. All rights reserved.
//

// Most of the code here is directly from
// https://developer.apple.com/documentation/uikit/uinavigationcontroller/customizing_your_app_s_navigation_bar


import UIKit

class LoginNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // edited this function to make nav bar transparent
        applyTransparentBackgroundToTheNavigationBar(0.0)
    }
    
    /// Configures the navigation bar to use a transparent background (see-through but without any blur).
    func applyTransparentBackgroundToTheNavigationBar(_ opacity: CGFloat) {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1),
                                               false,
                                               self.navigationBar.layer.contentsScale)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(red: 1, green: 1, blue: 1, alpha: opacity)
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        UIGraphicsEndImageContext()

        // removes border of Nav bar controller
        let navigationBarAppearance = self.navigationBar
        //navigationBarAppearance.setBackgroundImage(transparentBackground, for: .default)
        navigationBarAppearance.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBarAppearance.shadowImage = UIImage()
    }
    
    func applyBarTintColorToTheNavigationBar() {
        /*  Be aware when selecting a barTintColor for a translucent bar that
            the tint color will be blended with the content passing under
            the translucent bar.  See QA1808 for more information.
            <https://developer.apple.com/library/ios/qa/qa1808/_index.html>
        */
        let barTintColor = #colorLiteral(red: 0.7388114333, green: 0.9007369876, blue: 0.7299064994, alpha: 1)
        let darkendBarTintColor = #colorLiteral(red: 0.5541667552, green: 0.7134873905, blue: 0.5476607554, alpha: 1)
    
        /** Use the appearance proxy to customize the appearance of UIKit elements.
            However changes made to an element's appearance proxy do not affect any existing instances of that element currently
            in the view hierarchy. Normally this is not an issue because you will likely be performing your appearance customizations in
             -application:didFinishLaunchingWithOptions:. However, this example allows you to toggle between appearances at runtime
            which necessitates applying appearance customizations directly to the navigation bar.
        */
        // let navigationBarAppearance =
        //      UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        let navigationBarAppearance = self.navigationBar
        
        navigationBarAppearance.barTintColor = darkendBarTintColor

        // For comparison, apply the same barTintColor to the toolbar, which has been configured to be opaque.
        self.toolbar.barTintColor = barTintColor
        self.toolbar.isTranslucent = false
    }
    
}
