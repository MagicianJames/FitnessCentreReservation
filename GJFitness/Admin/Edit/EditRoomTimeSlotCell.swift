//
//  EditRoomTimeSlotCell.swift
//  GJFitness
//
//  Created by James S on 2/3/2564 BE.
//

import UIKit

class EditRoomTimeSlotCell: UICollectionViewCell {
    
    @IBOutlet var editRoomTimeslot: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        editRoomTimeslot.backgroundColor = .clear
        editRoomTimeslot.textColor = .white
        
        self.contentView.backgroundColor = .systemGray3
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.masksToBounds = true
    }
}
