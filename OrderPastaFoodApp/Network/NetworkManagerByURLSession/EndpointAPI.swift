//
//  EndpointAPI.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 14/10/24.
//

import Foundation
import UIKit

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum EndpointAPI {
    case login(param: LoginParam)
    case register(registerParam: RegistParam)
    case getAllMenu
    case posts
    case users
    
    func path() -> String {
        switch self {
        case .getAllMenu:
            return "/getAllMenu"
        case .posts:
            return "/posts"
        case .users:
            return "/users"
        case .login:
            return "/user/login"
        case .register:
            return "/user/register"
        }
    }
    
    func method() -> HTTPMethods {
        switch self {
        case .getAllMenu, .posts, .users:
            return .get
        case .login, .register:
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getAllMenu, .posts, .users:
            return nil
        case .login(let param):
            let params = [
                "username": param.username,
                "password": param.password
            ]
            return params
        case .register(let registerParam):
            let registerParams = [
                "username": registerParam.username,
                "password": registerParam.password,
                "confirmPassword": registerParam.confirmPassword
            ]
            return registerParams
        }
    }
    
    var headers: [String:String] {
        switch self {
        case .getAllMenu, .posts, .users, .login, .register :
            return [
                "Content-Type": "application/json",
                // bisa menambahkan yang lain jika diperlukan
            ]
        }
    }
    // untuk setingan api yang menggunakan query params
    var queryParams: [String: Any]? {
        return nil
    }
    // variabel getter untuk menghasilkan full url dari api
    var urlString: String {
        
        switch self {
        case .getAllMenu, .login, .register:
            return BaseConstants.base + self.path()
        default:
            return BaseConstants.baseURL + self.path()
        }
        
    }
}

struct BaseConstants {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    static let base = "http://localhost:3001/api/v1"
    static let userDefaults = UserDefaults.standard
}
