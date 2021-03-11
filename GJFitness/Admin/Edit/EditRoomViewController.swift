//
//  EditRoomViewController.swift
//  GJFitness
//
//  Created by James S on 28/2/2564 BE.
//

import UIKit

class EditRoomNumberItem {
    var editRoomNumber: String = ""
    
    init(editRoomNumber: String) {
        self.editRoomNumber = editRoomNumber
    }
}

class EditTimeItem {
    var editTimeslot: String = ""
    
    init(editTimeslot: String) {
        self.editTimeslot = editTimeslot
    }
}

class EditRoomViewController: UIViewController {
    
    @IBOutlet var bgView: UIView!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var lineview: UIView!
    
    @IBOutlet var roomEditNumber: UICollectionView!
    @IBOutlet var roomEditTimeslot: UICollectionView!
    
    var editRoomNumberItems: [EditRoomNumberItem] = []
    var editRoomTimeSlots: [EditTimeItem] = []

    var roomNumbers = ["1", "2", "3", "4"]
    var roomTimeSlotList = ["9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00"]
    
    var count = 0
    var count2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roomEditNumber.tag = 1
        roomEditTimeslot.tag = 2
        
        doneButton.layer.cornerRadius = 15
        lineview.layer.cornerRadius = 2
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 50
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        for i in 0...roomNumbers.count-1 {
            editRoomNumberItems.append(EditRoomNumberItem(editRoomNumber: roomNumbers[i]))
        }
        
        for i in 0...roomTimeSlotList.count-1 {
            editRoomTimeSlots.append(EditTimeItem(editTimeslot: roomTimeSlotList[i]))
        }

    }
    @IBAction func editroom_done(_ sender: UIButton) {
        print("editroom done")
        let alert = UIAlertController(title: "", message: "​Edit Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            
            
        }))
        self.present(alert, animated: true, completion: nil)

        
    }
}

extension EditRoomViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return editRoomNumberItems.count
            
        default:
            return editRoomTimeSlots.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        switch collectionView.tag {
        case 1:
            let roomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "edit_room_number_cell", for: indexPath) as! EditRoomNumberCell
            roomCell.editRoomNumber.text = editRoomNumberItems[index].editRoomNumber
            roomCell.tag = indexPath.row

            return roomCell
            
        default:
            let timeSlotCell = collectionView.dequeueReusableCell(withReuseIdentifier: "edit_room_time_slot", for: indexPath) as! EditRoomTimeSlotCell
            timeSlotCell.editRoomTimeslot.text = editRoomTimeSlots[index].editTimeslot
            
            return timeSlotCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("HEEER item at \(indexPath.section)/\(indexPath.item) tapped")
        switch collectionView.tag {
        case 1:
            let cell = collectionView.cellForItem(at: indexPath) as? EditRoomNumberCell
            NotificationCenter.default.post(name: .editRoomClickedOnlyOnce, object: indexPath.row)
            print(indexPath.row)
            
//            if count == 0 {
//                count = count + 1
//                cell?.contentView.backgroundColor = .systemYellow
//
//            } else {
//                count = 0
//                cell?.contentView.backgroundColor = .systemGray3
//
//            }
            
        default:
            let cell = collectionView.cellForItem(at: indexPath) as? EditRoomTimeSlotCell
            if count2 == 0 {
                count2 = count2 + 1
                cell?.contentView.backgroundColor = .systemYellow
                
            } else {
                count2 = 0
                cell?.contentView.backgroundColor = .systemGray3
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 4
        let spacingBetweenCells:CGFloat = 8
        
        let totalSpacing = (2 * 0) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.roomEditNumber {
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            
            return CGSize(width: width, height: 34)
            
        } else {
            return CGSize(width: 10, height: 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
