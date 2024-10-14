//
//  ToolBarView.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import Foundation
import UIKit

protocol ToolBarViewDelegate {
    func addTapButton()
}

class ToolBarView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var delegate: ToolBarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    //MARK: DI TEMPATKAN DI CODER KARNA MENGGUNAKAN XIB
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
        
        view.frame = self.bounds
        view.backgroundColor = .clear
        self.addSubview(view)
        setupButton()
    }
    func setup(title: String) {
        tittleLabel.text = title
    }
    
    func setupButton() {
        backButton.addTarget(self, action: #selector(actionToBackButton), for: .touchUpInside)
    }
    
    @objc func actionToBackButton() {
        if let viewController = self.getViewController() {
            viewController.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
}
