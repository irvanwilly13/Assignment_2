//
//  CustomInputField.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import Foundation
import UIKit

class CustomInputField: UIView{
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorUsernameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
        
        view.frame = self.bounds
        view.backgroundColor = .clear
        self.addSubview(view)
        
        configView()
    }
    
    func configView() {
        textField.placeholder = "Masukan Username"
        usernameLabel.text = "username"
        errorUsernameLabel.isHidden = true
        
        containerView.backgroundColor = .clear
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.clear.cgColor
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = false
        
        textField.layer.cornerRadius = 16
        textField.layer.backgroundColor = UIColor.clear.cgColor
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowOffset = CGSize(width: 2, height: 2)
        textField.layer.shadowRadius = 4
        textField.layer.masksToBounds = false
        
        textField.layer.shadowPath = UIBezierPath(roundedRect: textField.bounds, cornerRadius: textField.layer.cornerRadius).cgPath

    }
    
    func setup(title: String, placeholder: String) {
        usernameLabel.text = title
        textField.placeholder = placeholder
        
    }
}

