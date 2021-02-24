//
//  SwipeViewController.swift
//  Devour project 405
//
//  Created by Dowon on 2/24/21.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    var passedSection = ""
    
    override func viewDidLoad() {
        print(passedSection)
        testLabel.text = passedSection
        
        super.viewDidLoad()

        
    }
    

    

}
