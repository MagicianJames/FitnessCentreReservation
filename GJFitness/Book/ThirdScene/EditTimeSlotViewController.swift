//
//  EditTimeSlotViewController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 7/3/2564 BE.
//

import UIKit


class EditRoomItem {
    var roomName:  String = ""
    var roomTrainer: String = ""
   
    
    init(room: String, trainer: String) {
        self.roomName = room
        self.roomTrainer = trainer
      
    }
   
}
class EditTimeSlotViewController: UIViewController {

    
    @IBOutlet weak var editmySlotTable: UITableView!
    
    @IBOutlet var editclassImage: UIImageView!
    @IBOutlet var editclassName: UILabel!
    @IBOutlet var editcalendar: UILabel!
    @IBOutlet var edittime: UILabel!
    @IBOutlet var editnumOfmember: UILabel!
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    var myStringED = String()
    var myCalenED = String()
    var timeLimitED = String()
    var memberED = String()
    var selectedED = Int()
    
    //vc
    var counttimesED = 0
    var book_pictureAndClassnameED = [String]()
    var book_calendarED = [String]()
    var book_roomNameED = [String]()
    var book_trainerED = [String]()
    var book_timeED = [String]()
    
    var itemsED: [EditRoomItem] = []

    var roomED = ["Room1", "Room5", "Room2"]
    var trainerED = ["Krittamet Ch.", "Sanpawat S.", "Cleo P."]
    var timeDisplay2dED = [[ "15" , "16"], ["17", "18", "19" , "20"],["21", "22", "23"]]
    
    var timeDisplay3dED = [[[ "10:00" , "12:00"], ["13:00", "14:00", "15:00" , "16:00"],["17:00", "18:00", "19:00"]],
                         [[ "10:00" , "11:00"], ["12:00", "13:00", "14:00:00" , "15:00"],["13:00", "14:00", "15:00"]],
                         [[ "19:00" , "20:00"], ["11:00", "12:00", "13:00" , "14:00"],["15:00", "16:00", "17:00"]]]
    
    
    var timeDisplayColorED = [[[.systemGreen ,.systemGreen], [.systemGreen, .systemGreen, .systemGreen , .systemGreen],[.systemGreen, .systemGreen, .systemGreen]],
                            [[ .systemGreen , .systemGreen], [.systemGreen, .systemGreen, .systemGreen , .systemGreen],[.systemGreen, .systemGreen, .systemGreen]],
                            [[ .systemGreen , .systemGreen], [.systemGreen,.systemGreen, .systemGreen , UIColor.green],[.systemGreen, .systemGreen, .systemGreen]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        editclassImage.image = UIImage(named: myStringED)
        editclassName.text = myStringED
        editcalendar.text = myCalenED
        edittime.text = timeLimitED
        editnumOfmember.text = memberED
        
        editclassImage.layer.cornerRadius = 10
        editclassImage.contentMode = .scaleAspectFill
        
        for i in 0...roomED.count-1 {
            itemsED.append(EditRoomItem(room: roomED[i], trainer: trainerED[i]))
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(cellRoomClickedED(notification:)), name: .roomCellClickedED, object: nil)
    }
    
    @objc func cellRoomClickedED(notification: NSNotification) {
        if let data = notification.object as? (Int, String) {
            let alert = UIAlertController(title: "Change booking?", message: "\(roomED[data.0]) at \(data.1)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
//                let vc = self.storyboard?.instantiateViewController(identifier: "bookDisplayED") as! BookTableController
//                self.counttimesED += 1
//                self.book_pictureAndClassnameED += [self.myStringED]
//                self.book_calendarED += [self.myCalenED]
//                self.book_roomNameED += [self.roomED[data.0]]
//                self.book_trainerED += [self.trainerED[data.0]]
//                self.book_timeED += [data.1]
//
//                vc.book_counttimes = self.counttimesED
//                vc.arr_book_pictureAndClassname = self.book_pictureAndClassnameED
//                vc.arr_book_calendar = self.book_calendarED
//                vc.arr_book_roomName = self.book_roomNameED
//                vc.arr_book_trainer = self.book_trainerED
//                vc.arr_book_time = self.book_timeED
//


//                self.present(vc, animated: true, completion: nil)
                    print("upload timeslotVC to bookVC")

                let alert2 = UIAlertController(title: "", message: "​Change Successfully", preferredStyle: .alert)
                alert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in


                }))
                self.present(alert2, animated: true, completion: nil)


                print("Ok \(self.counttimesED)")
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    
    
    

}
extension EditTimeSlotViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsED.count
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 20
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCellED", for: indexPath) as! EditRoomViewCell
        cell.tag = index
    
       // cell.timeslots = timeDisplay2d[index]
        
        cell.timeslotsED = timeDisplay3dED[selectedED][index]
        cell.timeslotsColorED = timeDisplayColorED[selectedED][index]
        cell.roomED.text = itemsED[index].roomName
        cell.trainerED.text = itemsED[index].roomTrainer
        
        
        
//        cell.collecTime
        
        return cell
    }
    
   
    
  


    

}



