//
//  Ext+UiView.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 09/10/24.
//
import Foundation
import UIKit

extension UIView {
    func getViewController() -> UIViewController? {
        var nextResponder: UIResponder? = self
        while nextResponder != nil {
            nextResponder = nextResponder?.next
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
