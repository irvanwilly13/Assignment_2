//
//  OnBoardViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit

class OnBoardViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var nowLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setup()
        
    }
    func setup() {
        loginButton.addTarget(self, action: #selector(actionToLogin), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(actionToRegister), for: .touchUpInside)
        
        self.versionLabel.text = RemoteConfigManager.shared.versionApp
        self.messageLabel.text = RemoteConfigManager.shared.welcomeMessage
    }
    @objc func actionToLogin() {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func actionToRegister() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }



}
