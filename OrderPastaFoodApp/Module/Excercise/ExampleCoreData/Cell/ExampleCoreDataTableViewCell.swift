//
//  ExampleCoreDataTableViewCell.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 24/10/24.
//

import UIKit

class ExampleCoreDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    var toggleCompletion: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func completedButtonTapped(_ sender: UIButton) {
        toggleCompletion?()
    }
    
}
