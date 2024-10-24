//
//  ExampleProgramaticallyViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 22/10/24.
//

import UIKit

class ExampleProgramaticallyViewController: UIViewController {
    
    // boxView tidak diberikan default, bisa di atur di setupView
    let boxView = UIView()
    
    // boxView2 diberikan default
    let boxView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 75
        
        
        return view
    }()
    let textLabel = UILabel()
    
    let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 75
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "avatar1") // Replace "exampleImage" with the actual image name
        return imgView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    func setupView() {
        view.backgroundColor = .black
        // Set up the boxView
        boxView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(boxView)
        
        boxView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(boxView2)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        boxView2.addSubview(imgView)
        
        // Add Auto Layout constraints to center the boxView in the view
        NSLayoutConstraint.activate([
            boxView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            boxView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            boxView.widthAnchor.constraint(equalToConstant: 200),
            boxView.heightAnchor.constraint(equalToConstant: 200),
            
            boxView2.widthAnchor.constraint(equalToConstant: 150),
            boxView2.heightAnchor.constraint(equalToConstant: 150),
            boxView2.bottomAnchor.constraint(equalTo: boxView.topAnchor, constant: -10),
            boxView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            boxView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
        
        // Apply gradient to the boxView
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        boxView.layer.insertSublayer(gradientLayer, at: 0)
        
        // Set up the textLabel
        textLabel.text = "Hello, World!"
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        boxView.addSubview(textLabel)
        
        // Add Auto Layout constraints for the label inside the boxView
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: boxView.centerYAnchor),
            textLabel.widthAnchor.constraint(equalTo: boxView.widthAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: boxView2.topAnchor),
            imgView.bottomAnchor.constraint(equalTo: boxView2.bottomAnchor),
            imgView.leadingAnchor.constraint(equalTo: boxView2.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: boxView2.trailingAnchor)
        ])
    }
}
