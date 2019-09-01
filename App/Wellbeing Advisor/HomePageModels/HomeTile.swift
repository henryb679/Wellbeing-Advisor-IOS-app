//
//  HomeTile.swift
//  Wellbeing Advisor
//
//  Created by Henry Bai on 25/08/19.
//


import UIKit

class HomeTile: UICollectionViewCell {

    @IBOutlet var image: UIImageView!
    //@IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: HomeTileModel) {
        image.image = model.image
        //name.text = model.name
    }
}
