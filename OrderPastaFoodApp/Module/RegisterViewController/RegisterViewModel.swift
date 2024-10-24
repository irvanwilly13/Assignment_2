//
//  RegisterViewModel.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 16/10/24.
//

import Foundation
class RegisterViewModel {
    
    var networkManager = NetworkManager.shared
    var onLoading: ((_ loading: StateLoading?) -> Void)?
    
    var onUpdateItem: ((_ data: RegistResponse?) -> Void)?
    
    func requestData(param: RegistParam) {
        self.onLoading?(.loading)
        NetworkManager.shared.fetchRequest(endpoint: .register(registerParam: param), epecting: RegistResponse.self) { result in
            switch result {
            case .success(let data):
                print("Register berhasil")
                self .onLoading?(.finished)
                self .onUpdateItem?(data)
            case .failure(let error):
                print("Terjadi error: \(error)")
                self .onLoading?(.failed)
            }
            
        }
    }

}
