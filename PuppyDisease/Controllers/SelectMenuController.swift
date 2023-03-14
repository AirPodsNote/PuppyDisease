//
//  SelectMenuController.swift
//  PuppyDisease
//
//  Created by Herry on 2023/03/12.
//

import UIKit
import FirebaseAuth
class SelectMenuController : UIViewController {
    
    
    
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
    }

    @IBAction func logOutPressed(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
      
        
        navigationController?.popToRootViewController(animated: true)
        
        
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
    }
    
    @IBAction func skinMenuTapped(_ sender: UIButton) {
        
        if sender.restorationIdentifier == "skinButton" {
            performSegue(withIdentifier: "MenuToSkin", sender: self)
        } else if sender.restorationIdentifier == "eytButton" {
            performSegue(withIdentifier: "ManuToEye", sender: self)
        } else if sender.restorationIdentifier == "stomaButton" {
            performSegue(withIdentifier: "ManuToStoma", sender: self)
        } else {
            performSegue(withIdentifier: "ManuToBone", sender: self)
        }
        
    }
    
    
    
}
