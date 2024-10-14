//
//  LoginViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var usernameField: CustomInputField!
    @IBOutlet weak var passwordField: CustomInputField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configure()
    }
    
    func configure() {
        usernameField.setup(title: "Username", placeholder: "Masukkan Username")
        passwordField.setup(title: "Password", placeholder: "Masukkan Password")
    }
    
    func setup() {
        loginButton.addTarget(self, action: #selector(actionTologinButton), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(actionToRegisterButton), for: .touchUpInside)
    }
    
    @objc func actionTologinButton() {
        guard let email = usernameField.textField.text, let password = passwordField.textField.text else {
            showAlert(message: "Tidak boleh kosong")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                let errorMsg = self.handleFirebaseAuthError(error)
                self.showCustomPopup(PopUpModel(tittle: "Error", description: errorMsg, imgView: "errorX", twoButton: true))
                return
            }
            guard let user = authResult?.user else { return }
            user.getIDToken { token, error in
                if let error = error {
                    self.showAlert(message: error.localizedDescription)
                    return
                }
                if let token = token {
                    self.storeTokenInKeychain(token)
                    let vc = MainTabBarController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    @objc func actionToRegisterButton() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func storeTokenInKeychain(_ token: String) {
        let tokenData = Data(token.utf8)
        KeychainHelper.shared.save(tokenData, forKey: "firebaseAuthToken")
    }
}