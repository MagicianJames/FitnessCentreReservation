//
//  EditRoomViewCellTableViewCell.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 7/3/2564 BE.
//

import UIKit

class EditRoomViewCell: UITableViewCell {
    
    @IBOutlet var roomED: UILabel!
    
    @IBOutlet var trainerED: UILabel!
    
    @IBOutlet weak var slotCollectionED: UICollectionView!
    
    //    var timeDisplay = ["10:00", "12:00", "15:00", "16:00", "17:00" , "18:00"]
    
    var timeslotsColorED:[UIColor] = []
    var timeslotsED: [String] = []
    
    //vc
    var roomtableED = String()
    
    override func awakeFromNib() {
        //        print(timeDisplay.count)
        
        self.slotCollectionED.delegate = self
        self.slotCollectionED.dataSource = self
    }
    
    
    
    
    
    
}
extension EditRoomViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeslotsED.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slotTimeCellED", for: indexPath) as! EditSlotCollectionViewCell
        
        cell.editdisplayTimeSlot.text = timeslotsED[indexPath.row]
        cell.editdisplayTimeSlot.backgroundColor = timeslotsColorED[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 4
        let spacingBetweenCells:CGFloat = 4
        
        let totalSpacing = (2 * 0) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.slotCollectionED {
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            
            return CGSize(width: width, height: 34)
            
        }else{
            
            return CGSize(width: 124, height: 171)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(timeslotsED[indexPath.row])")
        print(self.tag)
        NotificationCenter.default.post(name: .roomCellClickedED, object: (self.tag, timeslotsED[indexPath.row]))
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Collection view at row \(collectionView.tag) selected index path \(timeslotsList[indexPath[1]])")
//
//        NotificationCenter.default.post(name: .timeCellClicked, object: (self.tag, timeslotsList[indexPath.row]))
//    }
//
    
    
    
}
