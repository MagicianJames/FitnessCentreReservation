//
//  EditSlotCollectionViewCell.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 7/3/2564 BE.
//

import UIKit

class EditSlotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var editdisplayTimeSlot: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        editdisplayTimeSlot.layer.cornerRadius = 5
        editdisplayTimeSlot.layer.masksToBounds = true
        
    }
}
