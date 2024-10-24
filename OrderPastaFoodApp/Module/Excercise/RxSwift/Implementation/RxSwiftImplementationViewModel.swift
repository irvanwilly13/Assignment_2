//
//  RxSwiftImplementationViewModel.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 17/10/24.
//
import UIKit
import Foundation
import RxSwift
import RxCocoa
import RxRelay

class RxSwiftImplementationViewModel {
    
    let subject = PublishSubject<Int>()
    let behaviorSubject = BehaviorSubject<String>(value: "Initial Value")
    let buttonTapRelay = PublishRelay<Void>()
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
    
    func setValueBehaviorSubject() {
        self.behaviorSubject.onNext(self.randomString(length: 10))
    }
    
    func setValueSubject() {
        self.subject.onNext(Int.random(in: 0...20))
    }
    
    func triggerRelay() {
        self.buttonTapRelay.accept(())
    }

}
