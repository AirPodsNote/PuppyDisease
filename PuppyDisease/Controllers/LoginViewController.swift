//
//  LoginViewController.swift
//  PuppyDisease
//
//  Created by Herry on 2023/03/11.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                
                if let e = error {
                    print(e)
                } else {
                    self?.performSegue(withIdentifier: "LoginToSelect", sender: self)
                }

            }
        }
        
    }
    
}
