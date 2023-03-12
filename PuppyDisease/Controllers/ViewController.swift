//
//  ViewController.swift
//  PuppyDisease
//
//  Created by Herry on 2023/03/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        loginButton.layer.cornerRadius = 8
        loginButton.layer.cornerCurve = .continuous
        
        registerButton.layer.cornerRadius = 8
        registerButton.layer.cornerCurve = .continuous

    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "GoToLogin", sender: sender)
    }
    
    
    @IBAction func RegisterButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "GoToRegister", sender: sender)
    }
    

}

