//
//  ChartService.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 10/10/24.
//
import Foundation
import UIKit

typealias CartTupleModel = (food: FoodItem, quantity: Int)

class CartService {
    static let shared = CartService()
    private init () {}
    
    private var cartItems: [FoodItem: Int] = [:]
    
    func addToCart(food: FoodItem) {
        cartItems[food, default: 0] += 1
    }
    
    func removeFromCart(food: FoodItem) {
        guard let count = cartItems[food], count > 0 else { return }
        if count == 1 {
            cartItems.removeValue(forKey: food)
        } else {
            cartItems[food] = count - 1
        }
    }

    
    func getCartItem() -> [CartTupleModel] {
        return cartItems.map { ($0.key, $0.value)}
    }
    
    
}
