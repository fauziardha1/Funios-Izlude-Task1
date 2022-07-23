//
//  SignUpViewController.swift
//  Funios-Izlude-Task-1
//
//  Created by FauziArda on 23/07/22.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    lazy var isEmailValid : Bool = false
    lazy var isPassValid : Bool = false
    
    lazy var signInLabel : UILabel = {
        let label = UILabel()
        
        label.text = "Sign Up"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40 ,weight: .regular)
        label.textColor = .black
        label.backgroundColor = .white
        
        return label
    }()
    
    lazy var emailErrorText : UILabel = {
        let label = UILabel()
        
        label.text = "Invalid Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .red
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        
        
        return label
    }()
    
    lazy var emailTextField : UITextField = {
        let textfield = UITextFieldWithPadding()
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Email"
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.backgroundColor = .white
        textfield.textPadding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        textfield.borderStyle = .roundedRect
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 1.0
        textfield.layer.cornerRadius = 5
        textfield.addTarget(self, action: #selector(handleEmailField), for: .editingChanged)
        textfield.autocapitalizationType = .none
        return textfield
    }()
    
    lazy var passErrorText : UILabel = {
        let label = UILabel()
        
        label.text = "Password too short"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .red
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        
        
        return label
    }()
    
    lazy var passTextField : UITextField = {
        let textfield = UITextFieldWithPadding()
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Password"
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.backgroundColor = .white
        textfield.textPadding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        textfield.borderStyle = .roundedRect
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 1.0
        textfield.layer.cornerRadius = 5
        textfield.isSecureTextEntry = true
        textfield.addTarget(self, action: #selector(handlePassField), for: .editingChanged)
        return textfield
    }()
    
    lazy var signInButton : UIButton = {
        let button = UIButton()
        button.setTitle("SIGN UP", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        button.addTarget(self, action: #selector(handleSignUpButton), for: .touchUpInside)
        
        return  button
    }()
    
    lazy var dontHaveAccountText : UILabel = {
        let label = UILabel()
        
        label.text = "Already have an account?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    lazy var signUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.addTarget(self, action: #selector(handleGoBackToSignIn), for: .touchUpInside)
        
        return  button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Hello world")
        arrangeView()
    }
    
    func arrangeView(){
        view.backgroundColor = .white
        view.addSubview(signInLabel)
        view.addSubview(emailTextField)
        view.addSubview(passTextField)
        view.addSubview(signInButton)
        view.addSubview(dontHaveAccountText)
        view.addSubview(signUpButton)
        view.addSubview(emailErrorText)
        view.addSubview(passErrorText)
        
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            signInLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            
            emailErrorText.bottomAnchor.constraint(equalTo: emailTextField.topAnchor),
            emailErrorText.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 20),
            emailTextField.leftAnchor.constraint(equalTo: signInLabel.leftAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: view.bounds.width - 80),
            
            
            passErrorText.bottomAnchor.constraint(equalTo: passTextField.topAnchor),
            passErrorText.leftAnchor.constraint(equalTo: passTextField.leftAnchor),
            
            passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor , constant: 15),
            passTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
            passTextField.widthAnchor.constraint(equalToConstant:  view.bounds.width - 80),
            
            signInButton.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 20),
            signInButton.leftAnchor.constraint(equalTo: passTextField.leftAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 80),
            
            dontHaveAccountText.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            dontHaveAccountText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            signUpButton.topAnchor.constraint(equalTo: dontHaveAccountText.bottomAnchor),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func handleGoBackToSignIn(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    @objc func handleEmailField(){
        let emailValue = emailTextField.text
        
        if isValidEmail(emailValue ?? ""){
            self.isEmailValid = true
            emailTextField.layer.borderColor = UIColor.lightGray.cgColor
            emailErrorText.isHidden = true
            signInButton.backgroundColor = .black
        }else{
            self.isEmailValid = false
            emailTextField.layer.borderColor = UIColor.red.cgColor
            emailErrorText.isHidden = false
            signInButton.backgroundColor = .gray
        }
    }
    
    @objc func handlePassField(){
        let passValue = passTextField.text
        
        if passValue?.count ?? 0 > 6 {
            self.isPassValid = true
            passTextField.layer.borderColor = UIColor.lightGray.cgColor
            passErrorText.isHidden  = true
            signInButton.backgroundColor = .black
        }else{
            self.isPassValid = false
            passTextField.layer.borderColor = UIColor.red.cgColor
            passErrorText.isHidden = false
            signInButton.backgroundColor = .lightGray
        }
    }
    
    @objc func handleSignUpButton(){
        if isEmailValid && isPassValid {
            print("email and pass valid and ready to go to home")
            self.navigationController?.pushViewController(HomeViewController(), animated: true)
            
        }else {
            handleEmailField()
            handlePassField()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


#if DEBUG
import SwiftUI
struct SignUpViewController_Preview  : PreviewProvider {
    static var previews: some View{
        ViewControllerPreview {
            SignUpViewController()
        }
        .previewInterfaceOrientation(.portrait)
    }
}


#endif
