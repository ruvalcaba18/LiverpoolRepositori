//
//  containerCell.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.
//

import UIKit

class containerCell: UICollectionViewCell {
    
static let identifier = "myCell"
    
    var isShimmerActive = true
    @IBOutlet weak var colorsCollections: UICollectionView!{
        didSet{
            colorsCollections.register(ColorsCell.self, forCellWithReuseIdentifier: ColorsCell.identifier)
        }
    }
    var arrayOfColors :Array<variantsColorResponse> = []
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var regularPriceLabel: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var productImage: UIImageView!{
        didSet{
            productImage.sizeToFit()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
    }
    
    func setUpCell(){
        self.fromNib()
        container.layer.cornerRadius = 15
        self.container.layer.cornerRadius = 15
        colorsCollections.delegate  = self
        colorsCollections.dataSource = self
    }
    
    
}

extension containerCell : UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  arrayOfColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorsCell.identifier, for: indexPath) as? ColorsCell else{
            return UICollectionViewCell()
        }
        DispatchQueue.main.async {[weak self] in
            let color = UIColor(hexString: self?.arrayOfColors[indexPath.row].colorHex ?? "");
            cell.backgroundColor = color
            self?.colorsCollections.reloadData()
        }
        return cell
    }
    
    
}
