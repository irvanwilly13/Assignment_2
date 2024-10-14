//
//  DetailCollectionViewCell.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    func configure() {
            // Mengatur border
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor.black.cgColor  // Ubah warna sesuai kebutuhan
            
            // Mengatur shadow
            self.layer.shadowColor = UIColor.black.cgColor  // Warna shadow hitam
            self.layer.shadowOpacity = 0.3                 // Transparansi shadow
            self.layer.shadowOffset = CGSize(width: 2, height: 2)  // Posisi shadow
            self.layer.shadowRadius = 4                    // Radius blur shadow
            self.layer.masksToBounds = false               // Agar shadow tidak terpotong
            
            
            self.layer.cornerRadius = 8
        }
    func setup(data: FoodItem?) {
        guard let data = data else {
            return
        }
        nameLabel.text = data.name
        descriptionLabel.text = data.description
        imgView.image = UIImage(named: data.image)
    }

}
