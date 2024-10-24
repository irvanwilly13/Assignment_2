//
//  ExampleSnapkitViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 22/10/24.
//

import UIKit
import SnapKit


class ExampleSnapkitViewController: UIViewController {
    
    let profileImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 75
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "avatar1") // Replace "exampleImage" with the actual image name
        return imgView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "irvan"
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 30)
        return label
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Kelapa Gading"
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 30)
        return label
    }()
    
    let editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 16
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    func setupView() {
        // Set up the background color of the view
        view.backgroundColor = .white
        
        // Add subviews to the main view
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(bioLabel)
        view.addSubview(editProfileButton)
        
        // Use SnapKit to set up constraints
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.width.height.equalTo(150) // width and height are equal to create a circular image
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20) // Optional padding from left and right
        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20) // Optional padding from left and right
        }
        
        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(bioLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
}
