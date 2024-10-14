//
//  ChartViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit

class ChartViewController: UIViewController {
    
    
    @IBOutlet weak var toolBarView: ToolBarView!
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var paymentButton: UIButton!
    
    
    private var cartItems: [(food: FoodItem, quantity: Int)] = []
    lazy var emptyStateView = EmptyView(frame: tableView.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCartItem()
        hideNavigationBar()
    }
    func hideNavigationBar() {
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.isNavigationBarHidden = true
        self.hidesBottomBarWhenPushed = false
    }
    func setup() {
        let nib = UINib(nibName: "ChartViewTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ChartViewTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        toolBarView.setup(title: "Cart Item")
        
    }
    func loadCartItem() {
        cartItems = CartService.shared.getCartItem()
        tableView.reloadData()
        updateEmptyStateView()
        updateTotalPrice()
        
    }
    func updateEmptyStateView() {
        tableView.isHidden = cartItems.isEmpty
        paymentButton.isHidden = cartItems.isEmpty
        shouldShowErrorView(status: cartItems.isEmpty)
    }
    func updateTotalPrice() {
        // Mulai dengan total harga 0
        var totalPrice: Double = 0.0
        
        // Iterasi setiap item di dalam cartItems
        for item in cartItems {
            totalPrice += item.food.price * Double(item.quantity)
        }
        
        // Format dan tampilkan total harga di priceLabel
        priceLabel.text = String(format: "Rp. %.2f", totalPrice)
    }
    
    
    func shouldShowErrorView(status: Bool) {
        switch status {
        case true:
            if !view.subviews.contains(emptyStateView) {
                view.addSubview(emptyStateView)
            } else {
                emptyStateView.isHidden = false
            }
        case false:
            if view.subviews.contains(emptyStateView) {
                emptyStateView.isHidden = true
            }
        }
    }
}

extension ChartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChartViewTableViewCell", for: indexPath) as? ChartViewTableViewCell
        if cell == nil {
            return UITableViewCell()
        }
        
        let item = cartItems[indexPath.row]
        cell?.configure(with: item.food, quantity: item.quantity)
        cell?.delegate = self
        return cell!
    }
    
}

extension ChartViewController: FoodChartItemTableViewCellDelegate {
    func cartItemCell(didTapAddFor food: FoodItem) {
        CartService.shared.addToCart(food: food)
        loadCartItem()
        updateTotalPrice()
    }
    
    func cartItemCell(didtapRemoveFor food: FoodItem) {
        CartService.shared.removeFromCart(food: food)
        loadCartItem()
        updateTotalPrice()
    }
}

