//
//  BookViewCell.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 7/2/2564 BE.
//

import UIKit

class BookViewCell: UITableViewCell {
    
    @IBOutlet var bookImageView: UIImageView!
    @IBOutlet var bookClassName: UILabel!
    @IBOutlet var bookCalendar: UILabel!
    @IBOutlet var bookRoomName: UILabel!
    @IBOutlet var bookTrainerName: UILabel!
    @IBOutlet var bookStartEnd: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bookImageView.layer.cornerRadius = 10
        bookImageView.contentMode = .scaleAspectFill
    }


}


