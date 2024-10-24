//
//  LoginViewModel.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 16/10/24.
//

import Foundation


class LoginViewModel {
    
    var networkManager = NetworkManager.shared
    var onLoading: ((_ loading: StateLoading?) -> Void)?
    
    var onUpdateItem: ((_ data: LoginResponse?) -> Void)?
    
    func requestData(param: LoginParam) {
        self.onLoading?(.loading)
        NetworkManager.shared.fetchRequest(endpoint: .login(param: param), epecting: LoginResponse.self) { result in
            switch result {
            case .success(let data):
                print("Login berhasil")
                self .onLoading?(.finished)
                self .onUpdateItem?(data)
            case .failure(let error):
                print("Terjadi error: \(error)")
                self .onLoading?(.failed)
            }
            
        }
    }

}
