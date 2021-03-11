//
//  LoginViewController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 4/3/2564 BE.
//

import UIKit
import Alamofire

class LoginViewController2: UIViewController {
    
    @IBOutlet var logoImageView: UIImageView!
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var signinButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    var urlLogin = "https://b759807fe12e.ngrok.io/login"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setElement()
        
    }
    
    @IBAction func login(_ sender: Any) {
        
        let masterUsername = "james"
        let masterPassword = "0000"
        
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        
        if masterUsername == username && masterPassword == password {
            
            let storyboard = UIStoryboard(name: "Admin", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "adminVC") as UIViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Invalid Credentials", message: "Incorrect username or password", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
        
        let parameters: [String: Any] = [
            "username": usernameField.text!,
            "password": passwordField.text!
        ]
        
        AF.request(urlLogin, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            print(response.response?.statusCode)
            
            switch response.result {
            case .success(let _):
                print("Insert successfully")
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "classList") as UIViewController
                
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
            case .failure(let error):
                print(error.errorDescription)
                
                let alert = UIAlertController(title: "Invalid Credentials", message: "Incorrect username or password", preferredStyle: .alert)
                
                let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                
            }
        })
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
