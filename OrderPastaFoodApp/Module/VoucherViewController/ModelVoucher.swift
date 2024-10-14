//
//  ModelVoucher.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 12/10/24.
//

import Foundation
import UIKit

struct VoucherFoodData {
    let name: String
    let description: String
}

let voucherData: [VoucherFoodData] = [
VoucherFoodData(name: "Discount 20%", description: "Min Pembelian Rp. 50.000"),
VoucherFoodData(name: "Discount 10%", description: "Min Pembelian Rp. 20.000"),
VoucherFoodData(name: "Buy 2 get 1", description: "Pengguna Baru")
]
