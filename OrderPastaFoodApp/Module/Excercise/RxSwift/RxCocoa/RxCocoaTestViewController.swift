//
//  RxCocoaTestViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 17/10/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class RxCocoaTestViewController: BaseViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: CustomInputField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var numberPhoneField: CustomInputField!
    
    let username = BehaviorRelay<String>(value: "")
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        binding()
        configure()
        
    }
    func configure() {
        nameTextField.setup(title: "username", placeholder: "Input Username")
        numberPhoneField.setup(title: "Phone Number", placeholder: "Input Phone Number")
        nameTextField.errorUsernameLabel.isHidden = true
        
        
    }
    func setup() {
        nameTextField.textField.rx.text
            .orEmpty // Mengubah Optional<String> menjadi String
            .map { text -> String in
                return text.trimmingCharacters(in: .whitespacesAndNewlines)
            }
            .bind(to: username) // Bind ke label text
            .disposed(by: disposeBag)
    }
    
    func binding() {
        
        numberPhoneField.textField.rx.text
            .orEmpty
            .map { text -> String in
                let formattedText = self.formatPhoneNumber(text)
                
                // Validasi: Harus dimulai dengan "08"
                if !formattedText.hasPrefix("08") && !formattedText.isEmpty {
                    self.numberPhoneField.errorUsernameLabel.text = "Phone number must start with '08'"
                    self.numberPhoneField.errorUsernameLabel.isHidden = false // Tampilkan error label
                } else {
                    self.numberPhoneField.errorUsernameLabel.isHidden = true // Sembunyikan error jika valid
                }
                
                return formattedText            }
            .bind(to: numberPhoneField.textField.rx.text) // Bind hasil yang diformat ke textField
            .disposed(by: disposeBag)
        
        // Binding button tap ke aksi untuk mencetak nama
        submitButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                guard let name = self.nameTextField.textField.text, !name.isEmpty else {
                    print("Name field is empty.")
                    return
                }
                print("Name submitted: \(name)")
            })
            .disposed(by: disposeBag)
        
        nameTextField.textField.rx.text
            .orEmpty
            .map { text -> String? in
                if text.count <= 2 {
                    return "Username must be at least 2 characters"
                } else if text.count > 16 {
                    return "Username cannot exceed 16 characters"
                } else {
                    return nil
                    
                }
            }
            .subscribe(onNext: { [weak self] errorMessage in
                self?.nameTextField.errorUsernameLabel.text = errorMessage
                
                if let error = errorMessage, !error.isEmpty {
                    self?.nameTextField.errorUsernameLabel.isHidden = false // Tampilkan error label jika ada pesan error
                } else {
                    self?.nameTextField.errorUsernameLabel.isHidden = true // Sembunyikan error label jika valid
                }
            })
            .disposed(by: disposeBag)
        
        // Update nameLabel jika input valid
        username
            .subscribe(onNext: { [weak self] name in
                self?.nameLabel.text = name
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: BISA DI JADIKAN EXTENSION
    
    func formatPhoneNumber(_ phoneNumber: String) -> String {
        // Hapus semua karakter yang bukan angka
        let cleanedPhoneNumber = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        // Batasi hanya sampai 15 karakter
        let limitedPhoneNumber = String(cleanedPhoneNumber.prefix(15))
        
        // Pisahkan menjadi kelompok 4 angka
        let groupedNumbers = stride(from: 0, to: limitedPhoneNumber.count, by: 4).map {
            let startIndex = limitedPhoneNumber.index(limitedPhoneNumber.startIndex, offsetBy: $0)
            let endIndex = limitedPhoneNumber.index(startIndex, offsetBy: min(4, limitedPhoneNumber.distance(from: startIndex, to: limitedPhoneNumber.endIndex)))
            return String(limitedPhoneNumber[startIndex..<endIndex])
        }
        
        // Gabungkan kembali dengan spasi di antara kelompok angka
        return groupedNumbers.joined(separator: " ")
    }
}



