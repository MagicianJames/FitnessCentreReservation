//
//  RoomNumberCell.swift
//  GJFitness
//
//  Created by James S on 14/2/2564 BE.

import UIKit

class RoomNumberCell: UICollectionViewCell {
    @IBOutlet var roomNumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        roomNumber.textColor = .white
        self.contentView.backgroundColor = .systemGray3
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.masksToBounds = true
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(cellClickedonlyOnce(notification:)), name: .roomClickedOnlyOnce, object: nil)
    }
    
    @objc func cellClickedonlyOnce (notification: NSNotification) {
        if let data = notification.object as? Int {
            if self.tag == data {
                self.contentView.backgroundColor = .systemYellow
            } else {
                self.contentView.backgroundColor = .systemGray3
            }
            
        }
    }
}

