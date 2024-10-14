//
//  VoucherTableViewCell.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 12/10/24.
//

import UIKit

class VoucherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var voucherNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
        
        containerView.layer.borderColor = UIColor.gray.cgColor // Atur warna border
                containerView.layer.borderWidth = 1.0
            
            // Agar sudut tampak melengkung (opsional)
            containerView.layer.cornerRadius = 10.0
            containerView.layer.masksToBounds = true
    }
    func configure(data: VoucherFoodData?) {
        guard let data = data else {
            return
        }
        voucherNameLabel.text = data.name
        descriptionLabel.text = data.description
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
