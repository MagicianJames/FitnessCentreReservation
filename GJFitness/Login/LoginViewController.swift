//
//  LoginViewController.swift
//  GJFitness
//
//  Created by James S on 15/2/2564 BE.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var logoImageView: UIImageView!
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var signinButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setElement()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
            super.touchesBegan(touches, with: event)
        }
    
    @IBAction func login(_ sender: Any) {
        
        let masterUsername = "great"
        let masterPassword = "0000"
        let userUsername = "james"
        let userPassword = "1111"
        
        
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        if userUsername == username && userPassword == password {
            if let vc = self.storyboard?.instantiateViewController(identifier: "classList") {
                present(vc, animated: true, completion: nil)
            }
            
        } else if masterUsername == username && masterPassword == password {
            if let vc = self.storyboard?.instantiateViewController(identifier: "classList") {
                present(vc, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Invalid Credentials", message: "Incorrect username or password", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func goSignUpScreen(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "signupScreen") {
            present(vc, animated: true, completion: nil)
        }
    }
    
    func setElement() {
        signinButton.layer.cornerRadius = 20
        signinButton.backgroundColor = .systemYellow
        signinButton.tintColor = .white
        
        logoImageView.image = UIImage(named:"logo")
        self.view.addSubview(logoImageView)
    }
    
}
