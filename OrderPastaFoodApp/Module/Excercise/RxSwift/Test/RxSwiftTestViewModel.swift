//
//  RxSwiftTestViewModel.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 17/10/24.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa
import RxRelay

class RxSwiftTestViewModel {
    
    let publishSubject = PublishSubject<Int>()
    let behaviorSubject = BehaviorSubject<String>(value: "Initial Value")
    let buttonTapRelay = PublishRelay<String>()
}
