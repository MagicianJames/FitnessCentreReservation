//
//  RoomViewCell.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 8/2/2564 BE.
//

import UIKit

class RoomViewCell: UITableViewCell {
    
    
    @IBOutlet var room: UILabel!
    
    @IBOutlet var trainer: UILabel!
    
    @IBOutlet weak var slotCollection: UICollectionView!
    
    //    var timeDisplay = ["10:00", "12:00", "15:00", "16:00", "17:00" , "18:00"]
    
    var timeslotsColor:[UIColor] = []
    var timeslots: [String] = []
    
    //vc
    var roomtable = String()
    
    override func awakeFromNib() {
        //        print(timeDisplay.count)
        
        self.slotCollection.delegate = self
        self.slotCollection.dataSource = self
    }
    
    
    
    
    
    
}
extension RoomViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeslots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slotTimeCell", for: indexPath) as! SlotCollectionViewCell
        
        cell.displayTimeSlot.text = timeslots[indexPath.row]
        cell.displayTimeSlot.backgroundColor = timeslotsColor[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 4
        let spacingBetweenCells:CGFloat = 4
        
        let totalSpacing = (2 * 0) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.slotCollection {
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
        print("Collection view at row \(collectionView.tag) selected index path \(timeslots[indexPath.row])")
        print(self.tag)
        NotificationCenter.default.post(name: .roomCellClicked, object: (self.tag, timeslots[indexPath.row]))
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Collection view at row \(collectionView.tag) selected index path \(timeslotsList[indexPath[1]])")
//
//        NotificationCenter.default.post(name: .timeCellClicked, object: (self.tag, timeslotsList[indexPath.row]))
//    }
//
    
    
    
}
