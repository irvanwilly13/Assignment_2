//
//  AdsTableViewCell.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit
import FirebaseAnalytics



class AdsTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var adsData: AdsFoodData?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(data: AdsFoodData?) {
            guard let data = data else {
                return
            }
            imgView.image = UIImage(named: data.image)
            nameLabel.text = data.name
        
            logAdViewEvent()
        }

    // Fungsi untuk menangani pemilihan cell (klik iklan)
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Jika iklan dipilih, log event dan buka URL iklan
        if selected {
            logAdClickEvent() // Log event ketika iklan diklik
            
            // Buka URL iklan jika ada
            if let url = URL(string: adsData?.url ?? "") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    func logAdViewEvent() {
            guard let adsData = adsData else { return }

            Analytics.logEvent("view_ad", parameters: [
                "ad_name": adsData.name,
                "ad_url": adsData.url
            ])
        }

        // Fungsi untuk mencatat event saat iklan diklik
        func logAdClickEvent() {
            guard let adsData = adsData else { return }

            Analytics.logEvent("select_ad", parameters: [
                "ad_name": adsData.name,
                "ad_url": adsData.url
            ])
        }

        
}
