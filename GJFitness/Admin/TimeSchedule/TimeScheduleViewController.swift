//
//  TimeScheduleViewController.swift
//  GJFitness
//
//  Created by James S on 13/2/2564 BE.

import UIKit
import Alamofire
import ObjectMapper

class RoomCellItem {
    var roomName: String = ""
    var roomTrainer: String = ""
    
    init(roomName: String, trainerName: String){
        self.roomName = roomName
        self.roomTrainer = trainerName
    }
}

class TimeScheduleViewController: UIViewController {
    
    @IBOutlet weak var timeSlotTable: UITableView!
    
    @IBOutlet weak var classImageViewInfo: UIImageView!
    @IBOutlet weak var classNameInfo: UILabel!
    
    @IBOutlet var date: UILabel!
    @IBOutlet var timeslot: UILabel!
    @IBOutlet var members: UILabel!
    
    var all_classes: AllClasses? = nil
    var class_detail: ClassEx? = nil
    let urlRoom = ""
        
    var classNameLabel = ""
    var classImage = UIImage()
    
    var myDate = String()
    var myMember = String()
    var timeLimit = String()
    var selected = Int()
        
    var rooms: [RoomCellItem] = []
    var roomNumber = ["Room1", "Room2", "Room3"]
    var trainers = ["Krittamet Ch.", "Sanpawat S.", "Cleo P."]
    var time3d = [[[ "09:00" , "10:00", "11:00", "12:00", "13:00", "14:00"], ["13:00", "14:00", "15:00" , "16:00"],["17:00", "18:00", "19:00"]], [[ "10:00" , "11:00"], ["12:00", "13:00", "14:00" , "15:00"],["13:00", "14:00", "15:00"]],
                  [[ "19:00" , "20:00"], ["11:00", "12:00", "13:00" , "14:00"],["15:00", "16:00", "17:00"]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classImageViewInfo.layer.cornerRadius = 10
        classImageViewInfo.image = classImage
        classNameInfo.text = classNameLabel
        
        for i in 0...roomNumber.count-1 {
            rooms.append(RoomCellItem(roomName: roomNumber[i], trainerName: trainers[i]))
        }
        
        updataDataToUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(cellTimeClicked(notification:)), name: .timeCellClicked, object: nil)
    }
    
    func updataDataToUI() {
        guard let class_detail = class_detail else {
            return
        }
        
        let url = URL(string: class_detail.picture_url)
        let data = try? Data(contentsOf: url!)
        
        classImageViewInfo.image = UIImage(data: data!)
        classNameInfo.text = class_detail.class_name
        date.text = class_detail.class_date
        timeslot.text = "10 hrs"
        members.text = "\(class_detail.people_number) per class"
    }
  
    @IBAction func addTrainerCell(_ sender: Any) {
        promptForAnswer()
    }
    
    private func promptForAnswer() {
        let ac = UIAlertController(title: "Enter trainer name", message: nil, preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = "Trainer name"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action:UIAlertAction) in
            let tfTrainerName = ac.textFields![0] as UITextField;
            UserDefaults.standard.set(tfTrainerName.text, forKey: "Trainer_name")
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(addAction)
        ac.addAction(cancelAction)
        present(ac, animated: true)
    }
    
    @objc func cellTimeClicked (notification: NSNotification) {
        if let data = notification.object as? (Int, String) {
            let alert = UIAlertController(title: "Confirm ?", message: "\(classNameLabel), \(roomNumber[data.0]) at ​\(data.1)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                
                let vc = self.storyboard?.instantiateViewController(identifier: "memberviewcontroller") as! MemberViewController
                
                vc.getClassName = self.classNameLabel
                vc.getImageClass = self.classImage
                vc.getTrainerRoom = self.trainers[data.0]
                vc.getRoomName = self.roomNumber[data.0]
                vc.getRoomNameFromTimeSchedule = "\(data.1)"
                
                //                vc.myString = arrayClasses[indexPath.item]
                //                vc.myCalen = calendarDisplay
                //                vc.myRoomName = arrayRoomName[indexPath.item]
                
                vc.class_detail = self.class_detail
                self.present(vc, animated: true, completion: nil)
                
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func editRoom(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Admin", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "EditRoomViewController") as? EditRoomViewController
        vc?.modalPresentationStyle = .popover
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    @IBAction func deleteRoom(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Confirm?", message: "​delete this room", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            
            let point = sender.convert(CGPoint.zero, to: self.timeSlotTable)
            guard let indexpath = self.timeSlotTable.indexPathForRow(at: point)
            else { return }
            
            self.rooms.remove(at: indexpath.row)
            self.timeSlotTable.beginUpdates()
            self.timeSlotTable.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
            self.timeSlotTable.endUpdates()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
//        let point = sender.convert(CGPoint.zero, to: timeSlotTable)
//        guard let indexpath = timeSlotTable.indexPathForRow(at: point)
//        else { return }
//
//        rooms.remove(at: indexpath.row)
//        timeSlotTable.beginUpdates()
//        timeSlotTable.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
//        timeSlotTable.endUpdates()
        
    }
    
    @IBAction func BackToClassList(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension TimeScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "room_cell", for: indexPath) as! RoomCell
        cell.tag = index
       
        cell.timeslotsList = time3d[selected][index]
        cell.roomNumber.text = rooms[index].roomName
        cell.trainerName.text = rooms[index].roomTrainer
        
        return cell
        
    }
}

