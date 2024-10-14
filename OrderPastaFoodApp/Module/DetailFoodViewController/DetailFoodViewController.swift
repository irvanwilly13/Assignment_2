//
//  DetailFoodViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit

class DetailFoodViewController: UIViewController {
    
    var item: FoodItem?
    
    @IBOutlet weak var toolBarView: ToolBarView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToChartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
        configure()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }
    
    func hideNavigationBar() {
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.isNavigationBarHidden = true
        self.hidesBottomBarWhenPushed = false
    }
    
    
    func setup() {
        addToChartButton.addTarget(self, action: #selector(actionTap), for: .touchUpInside)
        toolBarView.delegate = self
    }
    func loadData() {
    if let item = item {
            nameLabel.text = item.name
            imgView.image = UIImage(named: item.image)
            descriptionLabel.text = item.description
            priceLabel.text = String(item.price)
            
        }
            
    }
    func configure() {
        imgView.layer.borderColor = UIColor.gray.cgColor // Set warna border
        imgView.layer.borderWidth = 2.0                  // Set ketebalan border
        imgView.layer.cornerRadius = 10.0                // Set corner radius (opsional)
        imgView.layer.masksToBounds = true               // Pastikan sudut terpotong
    }

    
    @objc func actionTap() {
        if let foodItem = self.item {
            CartService.shared.addToCart(food: foodItem)
        }
    }
}


extension DetailFoodViewController: ToolBarViewDelegate {
    func addTapButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


