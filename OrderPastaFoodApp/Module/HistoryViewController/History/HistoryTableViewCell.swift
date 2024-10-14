//
//  HistoryTableViewCell.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 12/10/24.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stampImgView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.backgroundColor = UIColor.orange.withAlphaComponent(0.2)
                
                // Set corner radius
                containerView.layer.cornerRadius = 10.0
                containerView.layer.masksToBounds = false
                
                // Set shadow
                containerView.layer.shadowColor = UIColor.black.cgColor
                containerView.layer.shadowOpacity = 0.1
                containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
                containerView.layer.shadowRadius = 4.0
        
        containerView.layer.borderColor = UIColor.gray.cgColor // Atur warna border
                containerView.layer.borderWidth = 1.0 // Atur ketebalan border
    }
    func configure(data: HistoryFoodData?) {
        guard let data = data else {
            return
        }
        imgView.image = UIImage(named: data.image)
        nameLabel.text = data.name
        descriptionLabel.text = data.description
        priceLabel.text = data.description
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
