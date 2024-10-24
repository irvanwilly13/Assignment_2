//
//  ItemPlaceholderTableViewCell.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 14/10/24.
//

import UIKit

class ItemPlaceholderTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(data: PlaceholderModel) {
        idLabel.text = String(data.id)
        tittleLabel.text = data.name
        descriptionLabel.text = data.body
        
    }
    
}
