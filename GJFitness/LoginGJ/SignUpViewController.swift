//
//  SignUpViewController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 4/3/2564 BE.
//


import UIKit
import Alamofire
import ObjectMapper

class SignUpViewController2: UIViewController {
    
    @IBOutlet var logoImgaeView: UIImageView!
    
    @IBOutlet var firsnameField: UITextField!
    @IBOutlet var lastnameField: UITextField!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var signupButton: UIButton!
    
    let urlUser = "https://b759807fe12e.ngrok.io/insert-user"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setElement()
        
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func setElement() {
        signupButton.layer.cornerRadius = 20
        signupButton.backgroundColor = .systemYellow
        signupButton.tintColor = .white
        
        logoImgaeView.image = UIImage(named:"logo")
        self.view.addSubview(logoImgaeView)
    }
    
    @IBAction func doneSignUp(_ sender: Any) {
        postUserAPI(first_name: firsnameField.text!, last_name: lastnameField.text!, username: usernameField.text!, password: passwordField.text!, email: emailField.text!)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func postUserAPI(first_name: String, last_name: String, username: String, password: String, email: String) {
        let parametersUserPost = ["first_name": first_name,
                                  "last_name": last_name,
                                  "username": username,
                                  "password": password,
                                  "email": email]
        
        AF.request(urlUser, method: .post, parameters: parametersUserPost, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let data):
                
                print("Insert user successfully")
            case .failure(let error):
                print(error.errorDescription)
            }
        })
    }
    
}
