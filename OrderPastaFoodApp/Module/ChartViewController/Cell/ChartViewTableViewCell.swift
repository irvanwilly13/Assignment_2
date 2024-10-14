//
//  ChartViewTableViewCell.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 10/10/24.
//

import UIKit

protocol FoodChartItemTableViewCellDelegate: AnyObject {
    func cartItemCell(didTapAddFor food: FoodItem)
    func cartItemCell(didtapRemoveFor food: FoodItem)
}

class ChartViewTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    weak var delegate: FoodChartItemTableViewCellDelegate?
    private var food: FoodItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        plusButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonTap), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with food: FoodItem, quantity: Int) {
        self.food = food
        nameLabel.text = food.name
        priceLabel.text = String(format: "Rp %.2f", food.price)
        countLabel.text = "\(quantity)"
        imgView.image = UIImage(named: food.image)
        descriptionLabel.text = String(format: food.description)
    }
    
    @objc private func addButtonTap() {
        guard let food = food else { return }
        delegate?.cartItemCell(didTapAddFor: food)
    }
    @objc private func minusButtonTap() {
        guard let food = food else { return }
        delegate?.cartItemCell(didtapRemoveFor: food)
    }
    
}
