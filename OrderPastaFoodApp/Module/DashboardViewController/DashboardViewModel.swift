//
//  DashboardViewModel.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 15/10/24.
//

import Foundation
import UIKit
import RxSwift
import RxRelay
import RxCocoa

class DashboardViewModel: BaseViewModel {
    
    var networkManager = NetworkManager.shared
    var onLoading: ((_ loading: StateLoading?) -> Void)?
    var onUpdateFoodData: ((_ foodData: [FoodCategoryData]?, _ promoData: [PromotionFoodData]?, _ adsData: [AdsFoodData]?) -> Void)?
    
    var foodAppData = BehaviorRelay<FoodModel?>(value: nil)
    var disposeBag = DisposeBag()
    
    func requestData() {
        self.onLoading?(.loading)
        NetworkManager.shared.fetchRequest(endpoint: .getAllMenu, epecting: FoodModel.self) { result in
            switch result {
            case .success(let data):
                print("Items berhasil diambil: \(data)")
                self.onLoading?(.finished)
                // Kirim semua data: foodData, promoData, dan adsData
                self.onUpdateFoodData?(data.foodData, data.promoData, data.adsData)
                
            case .failure(let error):
                print("Terjadi error: \(error)")
                self.onLoading?(.failed)
            }
        }
    }
    func fetchRequestData() {
        self.loadingState.accept(.loading)
        NetworkManager.shared.fetchRequest(endpoint: .getAllMenu, epecting: FoodModel.self) { result in
            switch result {
            case .success(let data):
                print("items berhasil diambil: \(data)")
                self .loadingState.accept(.finished)
                self .foodAppData.accept(data)
            case .failure(let error):
                print("Terjadi error: \(error)")
                self .loadingState.accept(.failed)
            }
            
        }
    }
}
