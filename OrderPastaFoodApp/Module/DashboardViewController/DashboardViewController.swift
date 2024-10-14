//
//  DashboardViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit

enum FoodDashboardType: Int, CaseIterable {
    case foodCatergory = 0
    case foodDetail
    case promoFood
    case ads
}

class DashboardViewController: UIViewController {
    
    let dataAds = adsData
    let foodsData = foodData
    let dataPromo = promoData
    var selectedCategory: FoodCategory = .spagethi
    var currentItems: [FoodItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var optionButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        updateFoodItem( for: selectedCategory)
        hideNavigationBar()
        print("hello")
    }
    func setup() {
        let layout = UICollectionViewFlowLayout()
        //        layout.itemSize = CGSize(width: 130, height: 204)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        
        let nib = UINib(nibName: "FoodCategoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FoodCategoryTableViewCell")
        let nibDetail = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register(nibDetail, forCellReuseIdentifier: "DetailTableViewCell")
        let nibPromo = UINib(nibName: "PromoTableViewCell", bundle: nil)
        tableView.register(nibPromo, forCellReuseIdentifier: "PromoTableViewCell")
        let nibAds = UINib(nibName: "AdsTableViewCell", bundle: nil)
                tableView.register(nibAds, forCellReuseIdentifier: "AdsTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        optionButton.addTarget(self, action: #selector(tapToOptionButton), for: .touchUpInside)
    }
    @objc func tapToOptionButton() {
        let vc = LeftMenuBottomSheetViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    func updateFoodItem(for category: FoodCategory) {
        if let selectedData = foodData.first(where: { $0.category == category}) {
            currentItems = selectedData.items
            tableView.reloadData()
        }
    }
    func hideNavigationBar() {
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.hidesBottomBarWhenPushed = false
    }

}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = FoodDashboardType(rawValue: section)
        switch sectionType {
        case .foodCatergory:
            return 1
        case .foodDetail:
            return 1
        case .promoFood:
            return 1
        case .ads:
            return dataAds.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = FoodDashboardType(rawValue: indexPath.section)
        switch sectionType {
        case .foodCatergory: // case index 0
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCategoryTableViewCell", for: indexPath) as?  FoodCategoryTableViewCell
            cell?.categoryItems = foodsData
            cell?.onSelectCategory = { category in
                self.updateFoodItem(for: category)
                
            }
            return cell ?? UITableViewCell()
            
        case .foodDetail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as?  DetailTableViewCell
            cell?.items = currentItems
            cell?.onSelectItems = { item in
                self.navigateToDetail(item: item)
                
            }
            
            return cell ?? UITableViewCell()
            
        case .promoFood:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PromoTableViewCell", for: indexPath) as? PromoTableViewCell
            cell?.dataPromosi = dataPromo // cara memasukan data ke cell
            return cell ?? UITableViewCell()
            
        case .ads:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdsTableViewCell", for: indexPath) as? AdsTableViewCell
            cell?.configure(data: dataAds[indexPath.row])
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = FoodDashboardType(rawValue: indexPath.section)
        switch cellType {
        case .ads:
            let vc = AdsViewController()
            vc.url = dataAds[indexPath.row].url
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return FoodDashboardType.allCases.count // Ini akan mengembalikan 2 section: satu untuk kategori dan satu untuk detail.
    }
    func navigateToDetail(item: FoodItem) {
            let vc = DetailFoodViewController()
            vc.item = item
            
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
}
