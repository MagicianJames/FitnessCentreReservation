//
//  RoomCell.swift
//  GJFitness
//
//  Created by James S on 13/2/2564 BE.

import UIKit

class RoomCell: UITableViewCell {
    @IBOutlet var roomNumber: UILabel!
    @IBOutlet var trainerName: UILabel!
    @IBOutlet weak var slotCollection: UICollectionView!

    var timeslotsList: [String] = []
    
    override func awakeFromNib() {
        self.slotCollection.delegate = self
        self.slotCollection.dataSource = self
    }
}

extension RoomCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeslotsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath) as! TimeScheduleCollectionViewCell
        cell.timeslot.text = timeslotsList[indexPath.row]
        
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(timeslotsList[indexPath[1]])")
        
        print(self.tag)
        NotificationCenter.default.post(name: .timeCellClicked, object: (self.tag, timeslotsList[indexPath.row]))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let numberOfItemsPerRow:CGFloat = 4
            let spacingBetweenCells:CGFloat = 4
            
            let totalSpacing = (2 * 20) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
            
            if let collection = self.slotCollection {
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width, height: 34)
            }else{
                return CGSize(width: 84, height: 34)
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
