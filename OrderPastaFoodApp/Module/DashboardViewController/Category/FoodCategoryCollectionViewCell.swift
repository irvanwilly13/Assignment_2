//
//  FoodCategoryCollectionViewCell.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit

class FoodCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
        
    }
    func configure() {
        // Mengatur properti dasar seperti shadow dan border thickness
        containerView.layer.borderWidth = 2.0  // Atur ketebalan border
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = CGSize(width: 2, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.layer.masksToBounds = false
        
        // Corner radius untuk imgView agar serasi
        imgView.layer.cornerRadius = 8
        imgView.clipsToBounds = true
        
        // Background dan style untuk categoryLabel
        categoryLabel.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        categoryLabel.layer.cornerRadius = 4
        categoryLabel.clipsToBounds = true
    }
    
    func setup(item: FoodCategory) {
        imgView.image = UIImage(named: item.setImage())
        categoryLabel.text = item.rawValue
        
        switch item {
        case .spagethi:
            containerView.layer.borderColor = UIColor.red.cgColor
            containerView.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        case .lasagna:
            containerView.layer.borderColor = UIColor.green.cgColor
            containerView.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        case .pizza:
            containerView.layer.borderColor = UIColor.blue.cgColor
            containerView.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        case .drink:
            containerView.layer.borderColor = UIColor.yellow.cgColor
            containerView.backgroundColor = UIColor.yellow.withAlphaComponent(0.2)
        default:
            containerView.layer.borderColor = UIColor.gray.cgColor
            containerView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        }
    }
    
}
