//
//  ModelHistory.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 12/10/24.
//

import Foundation
import UIKit

struct HistoryFoodData {
    let name: String
    let image: String
    let description: String
    let price: Double
}

let historyData: [HistoryFoodData] = [
    HistoryFoodData(name: "Carbonara Spagethi ", image: "spagethi1", description: "Classic Italian Spagethi", price: 56000),
    HistoryFoodData(name: "Classic Lasagna ", image: "lasagna1", description: "Classic Italian Lasagna", price: 60000),
    HistoryFoodData(name: "American Pizza", image: "pizza2", description: "Pizza American Favorite",price: 60000),
    HistoryFoodData(name: "Milk Shake", image: "drink3", description: "Milk Shake Flavour", price: 34000)
]
