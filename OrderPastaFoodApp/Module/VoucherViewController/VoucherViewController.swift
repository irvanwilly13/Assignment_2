//
//  VoucherViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 12/10/24.
//

import UIKit

class VoucherViewController: UIViewController {
    
    @IBOutlet weak var toolBarView: ToolBarView!
    @IBOutlet weak var tableView: UITableView!
    
    var voucherData: [VoucherFoodData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
        toolBarView.setup(title: "Voucher")

    }
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let nib = UINib(nibName: "VoucherTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "VoucherTableViewCell")
    }
    func loadData() {
        voucherData = [
        VoucherFoodData(name: "Discount 20%", description: "Min Pembelian Rp. 50.000"),
        VoucherFoodData(name: "Discount 10%", description: "Min Pembelian Rp. 20.000"),
        VoucherFoodData(name: "Buy 2 get 1", description: "Pengguna Baru")
        ]
        tableView.reloadData()
    }
}

extension VoucherViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Mengembalikan jumlah baris dalam tabel
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voucherData.count
    }
    
    // Konfigurasi tampilan setiap cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoucherTableViewCell", for: indexPath) as! VoucherTableViewCell
        
        let data = voucherData[indexPath.row]
        cell.configure(data: data)
        
        return cell
    }
    
    // Aksi ketika salah satu voucher dipilih
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVoucher = voucherData[indexPath.row]
        print("Voucher terpilih: \(selectedVoucher.name)")
    }
}
