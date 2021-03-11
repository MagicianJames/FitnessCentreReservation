//
//  EditRoomNumberCell.swift
//  GJFitness
//
//  Created by James S on 2/3/2564 BE.
//

import UIKit

class EditRoomNumberCell: UICollectionViewCell {
    @IBOutlet var editRoomNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        editRoomNumber.textColor = .white
        self.contentView.backgroundColor = .systemGray3
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.masksToBounds = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(editOnlyOnce(notification:)), name: .editRoomClickedOnlyOnce, object: nil)
        }
        
    @objc func editOnlyOnce (notification: NSNotification) {
        if let data = notification.object as? Int {
            if self.tag == data {
                self.contentView.backgroundColor = .systemYellow
            } else {
                self.contentView.backgroundColor = .systemGray3
            }

        }
    }
}
