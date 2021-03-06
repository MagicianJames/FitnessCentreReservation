//
//  ClassViewCell.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 6/2/2564 BE.
//

import UIKit

class ClassViewCell: UICollectionViewCell {
    @IBOutlet var classImageView: UIImageView!
    @IBOutlet var className: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        classImageView.clipsToBounds = true
        classImageView.contentMode = .scaleAspectFill
        classImageView.layer.cornerRadius = 10
        className.layer.cornerRadius = 10
        className.layer.masksToBounds = true
        classImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        className.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }
}
