//
//  URLSessionModel.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 14/10/24.
//

import UIKit

struct PlaceholderCustom: Codable {
    let id: Int
    let body: String
    let userId: String
    let title: String
}

// MARK: - Welcome
struct PlaceholderModel: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

// MARK: - WelcomeElement
struct PlaceholderUser: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}
