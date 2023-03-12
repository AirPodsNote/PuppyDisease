//
//  RegisterViewController.swift
//  PuppyDisease
//
//  Created by Herry on 2023/03/11.
//

import UIKit
import FirebaseAuth

class RegisterViewController : UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: "RegisterToSelect", sender: self)
                }
            }
        }
        
    }
    
}
