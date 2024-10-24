//
//  RxSwiftImplementationViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 17/10/24.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa
import RxRelay

class RxSwiftImplementationViewController: BaseViewController {

    @IBOutlet weak var rxLabel: UILabel!
    @IBOutlet weak var changeNumberButton: UIButton!
    
    var disposeBag = DisposeBag()
    
    var viewModel = RxSwiftImplementationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testBehaviorSubject()
        setup()
        testPublishRelay()

    }
    
    func testSubject() {
        viewModel.subject.onNext(2) // selama belum di subscribe data tidak akan berubah, harus di panggil setelah di subscribe
        
        viewModel.subject.subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.rxLabel.text = String(data)
        }).disposed(by: disposeBag)
        viewModel.subject.onNext(9)
    }
    func testBehaviorSubject() {
        viewModel.behaviorSubject.subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.rxLabel.text = String(data)
        }).disposed(by: disposeBag)
        viewModel.behaviorSubject.onNext("Initial Value")
    }
    func testPublishRelay() {
        viewModel.buttonTapRelay.subscribe(onNext: {[weak self] data in
            guard let self = self else { return }
            self.showAlert(message: "test Publish")
        }).disposed(by: disposeBag)
    }
        
    func setup() {
        changeNumberButton.rx.tap.subscribe { [weak self] _ in
            guard let self = self else { return }
            // self.subject.onNext(Int.random(in: 0...20))
            self.viewModel.behaviorSubject.onNext(self.viewModel.randomString(length: 10))
            self.viewModel.triggerRelay()
        } .disposed(by: disposeBag)
    }
    
    func testRx() {
        let items = Observable.of(1, 2, 3, 4, 5, 6, 7)
        items.concatMap { item -> Observable<Int> in
            
            return Observable.just(item).delay(.seconds(1), scheduler: MainScheduler.instance)}
            .subscribe { [weak self] data in
            guard let self = self else { return }
            self.rxLabel.text = String(data)
        } .disposed(by: disposeBag)
    }
}
