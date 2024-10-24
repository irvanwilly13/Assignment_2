//
//  URLSessionViewModel.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 14/10/24.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class URLSessionViewModel: BaseViewModel {
    
    var networkManager = NetworkManager.shared
    var onLoading: ((_ loading: StateLoading?) -> Void)?
    var onUpdateItem: ((_ data: [PlaceholderUser]?) -> Void)?
    
    var placeholderData = BehaviorRelay<[PlaceholderUser]?>(value: nil)
    
    func requestData(url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    
    func fetchRequest() {
        Task {
            do {
                if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
                    let result = try await requestData(url: url)
                    print("data berhasil di dapat \(result)")
                    
                    let todo = try JSONDecoder().decode([PlaceholderUser].self, from: result)
                    self.onUpdateItem?(todo)
                }
            } catch let e {
                print("error \(e)")
            }
        }
    }
    
    
    func requestData() {
        self.onLoading?(.loading)
        NetworkManager.shared.fetchRequest(endpoint: .users, epecting: [PlaceholderUser].self) { result in
            switch result {
            case .success(let data):
                print("items berhasil diambil: \(data)")
                self .onLoading?(.finished)
                self .onUpdateItem?(data)
            case .failure(let error):
                print("Terjadi error: \(error)")
                self .onLoading?(.failed)
            }
            
        }
    }
    
    // MARK: BY RX
    func fetchRequestData() {
        self.loadingState.accept(.loading)
        NetworkManager.shared.fetchRequest(endpoint: .users, epecting: [PlaceholderUser].self) { result in
            switch result {
            case .success(let data):
                print("items berhasil diambil: \(data)")
                self .loadingState.accept(.finished)
                self .placeholderData.accept(data)
            case .failure(let error):
                print("Terjadi error: \(error)")
                self .loadingState.accept(.failed)
            }
            
        }
    }

}
