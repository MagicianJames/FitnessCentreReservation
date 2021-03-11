//
//  MemberViewController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 14/2/2564 BE.

import UIKit
import Alamofire
import ObjectMapper

class memberItem {
    var member: String = ""
    
    init(nameMember: String) {
        self.member = nameMember
    }
}

class MemberViewController: UIViewController {

    var items:[memberItem] = []
    var arrayMember = ["Joseph Smith", "Eren Freze", "Mikasa Sola"]
    
    @IBOutlet var roomName: UILabel!
    @IBOutlet var roomTime: UILabel!
    @IBOutlet var trainerName: UILabel!
    @IBOutlet var className: UILabel!
    @IBOutlet var classImage: UIImageView!
    @IBOutlet var date: UILabel!
    @IBOutlet var timeslot: UILabel!
    @IBOutlet var people_number: UILabel!
    
    var class_detail: ClassEx? = nil
    
    var getImageClass = UIImage()
    var getClassName = String()
    var getRoomNameFromTimeSchedule = String()
    var getRoomName = String()
    var getTrainerRoom = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...arrayMember.count-1 {
            items.append(memberItem(nameMember: arrayMember[i]))

        }
        
        classImage.layer.cornerRadius = 5
        classImage.contentMode = .scaleAspectFill
        
        classImage.image = getImageClass
        className.text = getClassName
        roomTime.text = getRoomNameFromTimeSchedule
        roomName.text = getRoomName
        trainerName.text = getTrainerRoom
        
        updateDataToUI()

    }
    
    func updateDataToUI() {
        guard let class_detail = class_detail else {
            return
        }
        
        let url = URL(string: class_detail.picture_url)
        let data = try? Data(contentsOf: url!)
        
        classImage.image = UIImage(data: data!)
        className.text = class_detail.class_name
        date.text = class_detail.class_date
        timeslot.text = "10 hrs"
        people_number.text = "\(class_detail.people_number) per class"
    }
    
    
    @IBAction func BackToRoomList(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MemberViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath) as! MemberTableViewCell
        
        
        cell.memberName.text = items[index].member
       // cell.timeslots = timeDisplay2d[index]
        
//        cell.timeslots = timeDisplay3d[selected][index]
//
//        cell.timeslotsColor = timeDisplayColor[selected][index]
//
//        cell.room.text = items[index].roomName
//
//        cell.trainer.text = items[index].roomTrainer
//
        
        
//        cell.collecTime
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}
