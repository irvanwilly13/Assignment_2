//
//  FirebaseAnalyticManager.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 24/10/24.
//

import Foundation
import FirebaseAnalytics

class FirebaseAnalyticsManager {
    static let shared = FirebaseAnalyticsManager()
    
    private init () {}
    
    func logEvent(buttonName: String, screenName: String) {
        Analytics.logEvent("button_pressed", parameters: [
            "button_name": buttonName as NSObject,
            "screen_name": screenName as NSObject
        ])
    }
}
