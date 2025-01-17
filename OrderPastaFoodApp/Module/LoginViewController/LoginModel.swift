//
//  LoginModel.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 16/10/24.
//

import Foundation

struct LoginParam {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let status, message: String
    let data: LoginData
}

// MARK: - DataClass
struct LoginData: Codable {
    let user: UserData
    let token: TokenData
}

// MARK: - Token
struct TokenData: Codable {
    let accessToken: String?
    let refreshToken: String
    let expiresIn: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
    }
}

// MARK: - User
struct UserData: Codable {
    let id: Int
    let name, email, username, phone: String
    let avatar: String
    let role: String
    let createdAt, updatedAt: String
}
