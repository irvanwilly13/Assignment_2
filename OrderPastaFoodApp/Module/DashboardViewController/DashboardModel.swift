//
//  DashboardModel.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import Foundation
import UIKit

enum FoodCategory: String, CaseIterable {
    case spagethi
    case lasagna
    case pizza
    case drink
    
    func setImage() -> String {
        switch self {
        case .spagethi:
            return "spagethi1"
        case .lasagna:
            return "lasagna1"
        case .pizza:
            return "pizza1"
        case .drink:
            return "drink1"
        }
    }
}

struct FoodItem: Hashable {
    let name: String
    let description: String
    let image: String
    let rating: Double
    let isFavorite: Bool
    let price: Double
}

struct FoodCategoryData {
    let category: FoodCategory
    let items: [FoodItem]
}

let foodData: [FoodCategoryData] = [
    FoodCategoryData(category: .spagethi,
                         items: [
                            FoodItem(name: "Carbonara Spagethi ", description: "Classic Italian Spagethi", image: "spagethi1", rating: 4.8, isFavorite: true, price: 56000),
                            FoodItem(name: "Mushroom Spagethi", description: "Spagethi with Italian Mushroom", image: "spagethi2", rating: 4.7, isFavorite: true, price: 60000),
                            FoodItem(name: "Prawn Spagethi ", description: "Spagethi with Prawn", image: "spagethi3", rating: 4.8, isFavorite: true, price: 62000)]),
    FoodCategoryData(category: .lasagna,
                         items: [
                            FoodItem(name: "Classic Lasagna ", description: "Classic Italian Lasagna", image: "lasagna1", rating: 4.8, isFavorite: true, price: 60000),
                            FoodItem(name: "Mozarela Lasagna ", description: "Classic Lasagna with Extra Mozarela", image: "lasagna2", rating: 4.8, isFavorite: true, price: 70000)]),
    FoodCategoryData(category: .pizza,
                         items: [
                            FoodItem(name: "Pepperoni Pizza ", description: "Classic Pepperoni Pizza", image: "pizza1", rating: 4.8, isFavorite: true, price: 58000),
                            FoodItem(name: "American Pizza", description: "Pizza American Favorite", image: "pizza2", rating: 4.7, isFavorite: true, price: 60000),
                            FoodItem(name: "Chicken Pizza", description: "Pizza with Chicken Roasted", image: "pizza3", rating: 4.8, isFavorite: true, price: 62000)]),
    FoodCategoryData(category: .drink,
                         items: [
                            FoodItem(name: "Soft Drink ", description: "Soda Drink", image: "drink1", rating: 4.8, isFavorite: true, price: 20000),
                            FoodItem(name: "Juice Drink", description: "Juice from Fresh Fruit", image: "drink2", rating: 4.7, isFavorite: true, price: 32000),
                            FoodItem(name: "Milk Shake", description: "Milk Shake Flavour", image: "drink3", rating: 4.8, isFavorite: true, price: 34000)])
]

struct PromotionFoodData {
    let name: String
    let image: String
}

let promoData: [PromotionFoodData] = [
PromotionFoodData(name: "Pasta Discount", image: "promosi1"),
PromotionFoodData(name: "Special Offer", image: "promosi2"),
PromotionFoodData(name: "Buy 1 Get 1", image: "promosi3")
]

struct AdsFoodData {
    let name: String
    let image: String
    let url: String
}

let adsData: [AdsFoodData] = [
AdsFoodData(name: "App Order Food", image: "ads1", url: "https://www.ecount.com/id/?S=01&C=17531188503&K=161192418452&keyword=aplikasi%20pembelian&matchtype=p&gad_source=1&gbraid=0AAAAAC3zoirs0mG5DJsPujLgc1b_r6o1U&gclid=CjwKCAjw3624BhBAEiwAkxgTOoYmrUIxssgpLG6_-08djjwbe4Xcu7ps6ZgSetUmZYpJFZeSADYcihoCDC8QAvD_BwE"),
AdsFoodData(name: "Pasta Restaurant", image: "ads2", url: "https://gambaranbrand.com/portfolio/warung-pasta/"),
AdsFoodData(name: "Pizza Information", image: "ads3", url: "https://id.wikipedia.org/wiki/Piza"),
AdsFoodData(name: "Pasta Information", image: "ads4", url: "https://id.wikipedia.org/wiki/Pasta")
]
