//
//  userPlaceholderTableViewCell.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 14/10/24.
//

import UIKit

class userPlaceholderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configure(data: PlaceholderUser) {
        idLabel.text = String(data.id)
        nameLabel.text = data.name
        usernameLabel.text = data.username
        emailLabel.text = data.email
        streetLabel.text = data.address.street
        suiteLabel.text = data.address.suite
        cityLabel.text = data.address.city
        zipcodeLabel.text = data.address.zipcode
        phoneLabel.text = String(data.phone)
        websiteLabel.text = data.website
    }
    func setup() {
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1.0
        
        // Atur corner radius
        containerView.layer.cornerRadius = 10.0
        containerView.layer.masksToBounds = false
        
        // Atur shadow
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4.0
    }
}


