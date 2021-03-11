//
//  TicketViewController.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 8/2/2564 BE.
//

import UIKit

class TicketViewController: UIViewController {

    @IBOutlet var ticketImage: UIImageView!
    @IBOutlet var ticketClassName: UILabel!
    @IBOutlet var ticketCalendar: UILabel!
    @IBOutlet var ticketRoomName: UILabel!
    @IBOutlet var ticketButton: UIButton!
    @IBOutlet var QRImage: UIImageView!
    
    var myString = String()
    var myCalen = String()
    var myRoomName = String()

    var image: UIImage = UIImage(named: "qr_code_test")!

    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func goEdit(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "EditBookDisplay") as! EditTimeSlotViewController
        vc.modalPresentationStyle = .fullScreen
        

          vc.myStringED = self.myString
          vc.myCalenED = self.myCalen
//          vc.myRoomNameED = self.myRoomName
        
        self.present(vc, animated: true, completion: nil)

  
        
        
    }
    
//    var room = ["Room 1", "Room2", "Room3"]
//    var trainer = ["Krittamet Ch.", "Cleo Powell", "Saharat T."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ticketImage.image = UIImage(named: myString)
        ticketClassName.text = myString
        ticketCalendar.text = myCalen
        ticketRoomName.text = myRoomName
        
        ticketImage.layer.cornerRadius = 10
        ticketImage.contentMode = .scaleAspectFill
        ticketButton.layer.cornerRadius = 20
        ticketButton.layer.masksToBounds = true
        ticketButton.backgroundColor = .systemRed
        
        self.QRImage.image = #imageLiteral(resourceName: "qr_code_test")
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
