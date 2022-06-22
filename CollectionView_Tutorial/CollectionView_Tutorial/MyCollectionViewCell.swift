//
//  MyCollectionViewCell.swift
//  CollectionView_Tutorial
//
//  Created by 이정찬 on 2022/06/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "MyCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: UIImage) {
        imageView.image = image
    }

    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
}
