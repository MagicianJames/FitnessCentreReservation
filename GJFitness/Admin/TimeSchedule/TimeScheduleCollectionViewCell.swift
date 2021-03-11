//
//  TimeScheduleCollectionView.swift
//  GJFitness
//
//  Created by James S on 13/2/2564 BE.

import UIKit

class TimeScheduleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeslot: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timeslot.textColor = .white
        timeslot.layer.cornerRadius = 5
        timeslot.layer.masksToBounds = true
    }
}
 
