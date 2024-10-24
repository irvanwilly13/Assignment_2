//
//  RxSwiftTestViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 17/10/24.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa
import RxRelay

class RxSwiftTestViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    var bag = DisposeBag()
    let publishSubject = PublishSubject<Int>()
    let behaviorSubject = BehaviorSubject<String>(value: "Initial Value")
    let buttonTapRelay = PublishRelay<String>()
    let behaviorRelay = BehaviorRelay<Int>(value: 0)
    //MARK
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        
    }
    
    func setupBindings() {
        // 1. Bind PublishSubject: Menerima data dari tombol tap count dan cetak ke console
        publishSubject
            .subscribe(onNext: { value in
                print("PublishSubject received value: \(value)")
            })
            .disposed(by: bag)
        
        // 2. Bind BehaviorSubject: Menampilkan data yang diubah di nameLabel
        behaviorSubject
            .subscribe(onNext: { [weak self] value in
                self?.nameLabel.text = value
            })
            .disposed(by: bag)
        
        // 3. Bind PublishRelay: Menerima aksi tap button dan mengubah text secara random
        buttonTapRelay
            .subscribe(onNext: { [weak self] value in
                self?.behaviorSubject.onNext(value)
            })
            .disposed(by: bag)
        
        // 4. Bind BehaviorRelay: Menghitung jumlah tap button
        behaviorRelay
            .subscribe(onNext: { count in
                print("Button tapped \(count) times")
            })
            .disposed(by: bag)
        
        // 5. Handle button tap
        changeButton.rx.tap
            .subscribe(onNext: { [weak self] in
                // Update tap count (BehaviorRelay)
                let newCount = (self?.behaviorRelay.value ?? 0) + 1
                self?.behaviorRelay.accept(newCount)
                
                // Trigger PublishSubject
                self?.publishSubject.onNext(newCount)
                
                // Trigger PublishRelay with new random string value
                let randomText = ["Hello", "World", "RxSwift", "Swift"].randomElement() ?? "Default"
                self?.buttonTapRelay.accept(randomText)
            })
            .disposed(by: bag)
    }
    
}
