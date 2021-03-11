//
//  TimeSlotController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 8/2/2564 BE.
//

import UIKit

class RoomItem {
    var roomName:  String = ""
    var roomTrainer: String = ""
   
    
    init(room: String, trainer: String) {
        self.roomName = room
        self.roomTrainer = trainer
      
    }
   
}
class TimeSlotController: UIViewController {

    
    @IBOutlet weak var mySlotTable: UITableView!
    
//    @IBOutlet weak var classImageViewInfo: UIImageView!
//    @IBOutlet weak var classNameInfo: UILabel!
//
    @IBOutlet var classImage: UIImageView!
    @IBOutlet var className: UILabel!
    @IBOutlet var calendar: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var numOfmember: UILabel!

    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    //new add 
    var all_classes: AllClasses? = nil
    var class_detail: ClassEx? = nil
//    let urlClass = "https://89982d07ef6a.ngrok.io/class"
    let urlRoom = ""
    
    var classNameLabel = ""
    var classImage2 = UIImage()
    
    
    var myString = String()
    var myCalen = String()
    var timeLimit = String()
    var member = String()
    var selected = Int()
    
    //vc
    var counttimes = 0
    var book_picture = [UIImage]()
    var book_pictureAndClassname = [String]()
    var book_calendar = [String]()
    var book_roomName = [String]()
    var book_trainer = [String]()
    var book_time = [String]()
    
    var items: [RoomItem] = []

    var room = ["Room1", "Room5", "Room2"]
    var trainer = ["Krittamet Ch.", "Sanpawat S.", "Cleo P."]
    var timeDisplay2d = [[ "15" , "16"], ["17", "18", "19" , "20"],["21", "22", "23"]]
    
    var timeDisplay3d = [[[ "10:00" , "12:00"], ["13:00", "14:00", "15:00" , "16:00"],["17:00", "18:00", "19:00"]],
                         [[ "10:00" , "11:00"], ["12:00", "13:00", "14:00:00" , "15:00"],["13:00", "14:00", "15:00"]],
                         [[ "19:00" , "20:00"], ["11:00", "12:00", "13:00" , "14:00"],["15:00", "16:00", "17:00"]]]
    
    
    var timeDisplayColor = [[[.systemGreen ,.systemGreen], [.systemGreen, .systemGreen, .systemGreen , .systemGreen],[.systemGreen, .systemGreen, .systemGreen]],
                            [[ .systemGreen , .systemGreen], [.systemGreen, .systemGreen, .systemGreen , .systemGreen],[.systemGreen, .systemGreen, .systemGreen]],
                            [[ .systemGreen , .systemGreen], [.systemGreen,.systemGreen, .systemGreen , UIColor.green],[.systemGreen, .systemGreen, .systemGreen]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classImage.layer.cornerRadius = 10
        classImage.image = classImage2
        className.text = classNameLabel

        // Do any additional setup after loading the view.
        
//        classImage.image = UIImage(named: myString)
//        className.text = myString
//        calendar.text = myCalen
//        time.text = timeLimit
//        numOfmember.text = member
//        
//        classImage.layer.cornerRadius = 10
//        classImage.contentMode = .scaleAspectFill
        
        for i in 0...room.count-1 {
            items.append(RoomItem(room: room[i], trainer: trainer[i]))
        }
        
        updataDataToUI()

        
        NotificationCenter.default.addObserver(self, selector: #selector(cellRoomClicked(notification:)), name: .roomCellClicked, object: nil)
    }
    
    func updataDataToUI() {
        guard let class_detail = class_detail else {
            return
        }
        
        let url = URL(string: class_detail.picture_url)
        let data = try? Data(contentsOf: url!)
        
        classImage.image = UIImage(data: data!)
        className.text = class_detail.class_name
        calendar.text = class_detail.class_date
        time.text = "10 hrs"
        numOfmember.text = "\(class_detail.people_number) per class"
    }
    

    
    @objc func cellRoomClicked(notification: NSNotification) {
        if let data = notification.object as? (Int, String) {
            let alert = UIAlertController(title: "Are you confirm to book?", message: "\(room[data.0]) at \(data.1)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                
                
                
                
                let vc = self.storyboard?.instantiateViewController(identifier: "bookDisplay") as! BookTableController
                self.counttimes += 1
                self.book_picture += [self.classImage2]
                self.book_pictureAndClassname += [self.myString]
                self.book_calendar += [self.myCalen]
                self.book_roomName += [self.room[data.0]]
                self.book_trainer += [self.trainer[data.0]]
                self.book_time += [data.1]
//                vc.book_pictureAndClassname = self.myString
//                vc.book_time = data.1
//                vc.book_trainer = self.trainer[data.0]
//                vc.book_calendar = self.myCalen
//                vc.book_roomName = self.room[data.0]
                
                
                vc.book_counttimes = self.counttimes
                vc.arr_book_picture = self.book_picture
                vc.arr_book_pictureAndClassname = self.book_pictureAndClassname
                vc.arr_book_calendar = self.book_calendar
                vc.arr_book_roomName = self.book_roomName
                vc.arr_book_trainer = self.book_trainer
                vc.arr_book_time = self.book_time
                
               
            
//                self.present(vc, animated: true, completion: nil)
//                    print("upload timeslotVC to bookVC")
                
                let alert2 = UIAlertController(title: "", message: "​Book Successfully", preferredStyle: .alert)
                alert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true, completion: nil)
                    

                    
                }))
                self.present(alert2, animated: true, completion: nil)

                
                print("Ok \(self.counttimes)")
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
//    @objc func bookSuccess(notification: NSNotification) {
//        if let data = notification.object as? String {
//            let alert = UIAlertController(title: "Book successfully", message: "\(data)", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
//
//                print("done")
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
    
    
    
    

}
extension TimeSlotController: UITableViewDataSource, UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 20
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomViewCell
        cell.tag = index
    
       // cell.timeslots = timeDisplay2d[index]
        
        cell.timeslots = timeDisplay3d[selected][index]
        cell.timeslotsColor = timeDisplayColor[selected][index]
        cell.room.text = items[index].roomName
        cell.trainer.text = items[index].roomTrainer
        
        
        
//        cell.collecTime
        
        return cell
    }
    
   
    
  
  
    
//    //new add
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let tableViewCell = cell as? RoomViewCell else { return }
//
//        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
//       // tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
//    }
//    func showAlert(title: String, message: String){
//        let alert = UIAlertController(title: "Invalid Credentials", message: "Incorrect username or password", preferredStyle: .alert)
//        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//        alert.addAction(alertAction)
//        self.present(alert, animated: true, completion: nil)
//    }


    

}



