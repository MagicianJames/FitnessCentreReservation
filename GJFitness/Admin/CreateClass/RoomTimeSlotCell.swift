//
//  RoomTimeSlotCell.swift
//  GJFitness
//
//  Created by James S on 14/2/2564 BE.

import UIKit

class RoomTimeSlotCell: UICollectionViewCell {
    @IBOutlet var roomTimeSlot: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        roomTimeSlot.backgroundColor = .clear
        roomTimeSlot.textColor = .white
        
        self.contentView.backgroundColor = .systemGray3
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.masksToBounds = true
        

    }

}
