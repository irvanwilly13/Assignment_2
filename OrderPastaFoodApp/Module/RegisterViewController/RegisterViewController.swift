//
//  RegisterViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit
import FirebaseAuth

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var usernameField: CustomInputField!
    @IBOutlet weak var passwordField: CustomInputField!
    @IBOutlet weak var confirmPasswordField: CustomInputField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configure()
    }
    
    func setup() {
        createAccountButton.addTarget(self, action: #selector(actionToCreateButton), for: .touchUpInside)
    }
    
    func configure() {
        usernameField.setup(title: "Username", placeholder: "Masukan Username")
        passwordField.setup(title: "Password", placeholder: "Masukan Password")
        confirmPasswordField.setup(title: "Confirm Password", placeholder: "Masukan Password")
    }
    
    @objc func actionToCreateButton() {
        guard let email = usernameField.textField.text, let password = passwordField.textField.text, let confirmPassword = confirmPasswordField.textField.text else {
            showAlert(message: "Tidak boleh kosong")
            return
        }
        if password != confirmPassword {
            self.showAlert(message: "Password Doesn't Match")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                let errorMsg = self.handleFirebaseAuthError(error)
                self.showAlert(message: errorMsg)
                return
            }
            self.showAlertSuccess(title: "Success", message: "Have successfully created an account") {
                let vc = LoginViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func showAlertSuccess(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // Memanggil closure jika diberikan
            completion?()
        }
        
        alertController.addAction(okAction)
        
        // Menampilkan alert
        self.present(alertController, animated: true, completion: nil)
    }
}
