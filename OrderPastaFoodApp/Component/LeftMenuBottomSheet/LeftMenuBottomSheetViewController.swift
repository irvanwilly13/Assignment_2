//
//  LeftMenuBottomSheetViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 10/10/24.
//

import UIKit


class LeftMenuBottomSheetViewController: UIViewController {
    
    @IBOutlet weak var coachMarkView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var voucherButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setup()
        addGradientBackground()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showAnimation()
        
    }
    
    func setup() {
        logoutButton.addTarget(self, action: #selector(actionToLogoutButton), for: .touchUpInside)
        
        profileButton.addTarget(self, action: #selector(navigateToAccountInformation), for: .touchUpInside)
        voucherButton.addTarget(self, action: #selector(navigateToVoucher), for: .touchUpInside)
        historyButton.addTarget(self, action: #selector(navigateToHistoryOrder), for: .touchUpInside)
        cartButton.addTarget(self, action: #selector(navigateToCart), for: .touchUpInside)
        
    }
    
    @objc func actionToLogoutButton() {
        FirebaseAnalyticsManager.shared.logEvent(buttonName: "logout_button", screenName: "screen_left_menu")
        self.dismiss(animated: true) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.handleLogout()
            }
        }
        
    }
    @objc func navigateToAccountInformation() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func navigateToVoucher() {
        let vc = VoucherViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func navigateToHistoryOrder() {
        let vc = HistoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func navigateToCart() {
        let vc = ChartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAnimation() {
        self.containerView.transform = CGAffineTransform(translationX: -self.view.frame.height, y: 0.0)
        self.coachMarkView.alpha = 0.0
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseIn]) {
            self.containerView.transform = .identity
            self.coachMarkView.alpha = 1.0
            
        }
    }
    func configure() {
        coachMarkView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCoachMark)))
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        containerView.addGestureRecognizer(panGesture)
    }
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        switch gesture.state {
        case .changed:
            if translation.x <= 0 {
                containerView.transform = CGAffineTransform(translationX: translation.x, y: 0)
            }
        case .ended:
            let dismissThreshold: CGFloat = -100
            if translation.x < dismissThreshold || velocity.x < -500 {
                UIView.animate(withDuration: 0.3) {
                    self.dismiss(animated: true, completion: nil)
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.containerView.transform = .identity
                }
            }
        default:
            break
        }
    }
    
    @objc func tapCoachMark() {
        UIView.animate(withDuration: 0.3) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func addGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = containerView.bounds
        
        // Tentukan warna-warna gradasi
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemRed.cgColor
        ]
        
        // Tentukan arah gradasi (dari atas ke bawah)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        // Tambahkan layer gradasi ke containerView
        containerView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
