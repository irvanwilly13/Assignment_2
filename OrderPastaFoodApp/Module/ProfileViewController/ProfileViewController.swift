//
//  ProfileViewController.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit

//MARK: TAMBAHKAN LABEL UNTUK TANGGAL ULANG TAHUN, BIDA DI TEMPATKAN DI PROFILE ATAU DI LEFT MENU

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var containerImg: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var changeImgButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    
    let pickerImage = UIImagePickerController()
    var imageChosen = [UIImagePickerController.InfoKey: Any]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
        
    }
    
    func setup() {
        containerImg.clipsToBounds = true
        changeImgButton.addTarget(self, action: #selector(tapGallery), for: .touchUpInside)
        dateButton.addTarget(self, action: #selector(actionToDateButton), for: .touchUpInside)
    }
    @objc func actionToDateButton() {
        let vc = DatePickerViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func tapGallery() {
        self.pickerImage.allowsEditing = true
        self.pickerImage.delegate = self
        self.pickerImage.sourceType = .photoLibrary
        self.present(self.pickerImage, animated: true)
    }
    func hideNavigationBar() {
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.isNavigationBarHidden = true  // Sembunyikan navigation bar
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.imageChosen = info
        self.imgView.image = image
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
