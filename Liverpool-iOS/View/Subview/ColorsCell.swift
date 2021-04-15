//
//  ColorsCell.swift
//  Liverpool-iOS
//
//  Created by Jael Ruvalcaba on 15/04/21.
//

import UIKit

class ColorsCell: UICollectionViewCell {
static let identifier = "Colors"
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setUpCell(){
        self.fromNib()
        layer.cornerRadius = 10
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth  = 2.5
    }
    
    
    
}
