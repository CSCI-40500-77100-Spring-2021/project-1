//
//  TableVC.swift
//  Devour
//
//  Created by John Solano on 3/3/21.
//  Copyright © 2021 John Solano. All rights reserved.
//

import UIKit
import Firebase

class TableVC: UIViewController {

    @IBOutlet weak var createTableBtn: UIButton!
    @IBOutlet weak var deleteTableBtn: UIButton!
    @IBOutlet weak var createTableLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    
    @IBAction func createTableTapped(_ sender: Any) {
        // generate random code
        let code : String = randomString(length: 5)
        
        // create table code group in db
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        ref = Database.database().reference()
        ref.child("tables").child(code).setValue([
            "TableCode" : code,
            "Members" : [userID]
            ])
        
        // update current users table code
        ref.child("users").child(userID).updateChildValues([
            "TableCode": code
        ])
        
        // update label
        createTableLbl.text = String(code)
        
        //disable button
        createTableBtn.isEnabled = false
        
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        // Get code from label
        let code : String = createTableLbl.text!
        print(code)
        // delete that in the database
        ref = Database.database().reference()
        ref.child("tables").child(code).removeValue()
        // Update users code room
        guard let userID = Auth.auth().currentUser?.uid else { return }
        ref.child("users").child(userID).updateChildValues([
            "TableCode": "-----"
        ])
        // reset label
        createTableLbl.text = "Table Code"
        // Enable Create Table Button
        createTableBtn.isEnabled = true
        
    }
    
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}
