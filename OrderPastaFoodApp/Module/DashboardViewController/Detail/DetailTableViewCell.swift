//
//  DetailTableViewCell.swift
//  OrderPastaFoodApp
//
//  Created by Muhammad Farrel Al Fathir on 08/10/24.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [FoodItem] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var onSelectItems: ((_ category: FoodItem) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    func setup() {
        let layout = CustomLayoutCollectionView()
        collectionView.collectionViewLayout = layout
        
        let nib = UINib(nibName: "DetailCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "DetailCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
extension DetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as?  DetailCollectionViewCell
        
        cell?.setup(data: items[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: (screenWidth / 2) - 10, height: 188)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelectItems?(items[indexPath.row])
    }
    
}
