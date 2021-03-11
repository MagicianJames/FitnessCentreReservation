//
//  SlotCollectionViewCell.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 9/2/2564 BE.
//

import UIKit

class SlotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var displayTimeSlot: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        displayTimeSlot.layer.cornerRadius = 5
        displayTimeSlot.layer.masksToBounds = true
        
    }
}
