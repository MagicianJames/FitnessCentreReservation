//
//  TrainerViewController.swift
//  GJFitness
//
//  Created by James S on 23/2/2564 BE.
//

import UIKit
import Alamofire
import ObjectMapper

class TrainerViewController: UIViewController {
    @IBOutlet var trainerTableView: UITableView!
    
    var trainer: Trainer? = nil
    var trainers: Trainers? = nil
    let url = "https://b759807fe12e.ngrok.io/trainer"
    let url2 = "https://b759807fe12e.ngrok.io/insert-trainer"
    let urlTrainerDelete = "https://b759807fe12e.ngrok.io/delete-trainer"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trainerTableView.dataSource = self
        trainerTableView.delegate = self
        
//        deleteTrainerItemAPI(id: (trainer?.trainers.id)!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        requestTrainerAPI()
    }
    
    func updateDataToUI() {
        trainerTableView.reloadData()
    }
    
    func requestTrainerAPI() {
        AF.request(url).responseString { (response) in
            if let value = response.value,
               let trainerResponse = Mapper<Trainer>().map(JSONString: value) {
                self.trainer = trainerResponse
                self.updateDataToUI()
            }
            
        }
    }
    
    func postTrainerAPI(first_name: String, last_name: String, phone_number: String) {
        AF.request(url2, method: .post, parameters: ["first_name": first_name, "last_name": last_name, "phone_number": phone_number], encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
                case .success(let data):
                    
                    print("Insert successfully")
                    self.requestTrainerAPI()
                case .failure(let error):
                    print(error.errorDescription)
                }
        })
    }
    
    func deleteTrainerItemAPI(id: Int) {
        AF.request(urlTrainerDelete, method: .post, parameters: ["id": id], encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
                case .success(let data):
                    
                    print("Insert successfully")
                    self.requestTrainerAPI()
                case .failure(let error):
                    print(error.errorDescription)
                }
        })
    }
    
    @IBAction func addTrainer(_ sender: Any) {
        promptForAnswer()
    }
    
    private func promptForAnswer() {
        let ac = UIAlertController(title: "Enter trainer name and phone numeber", message: nil, preferredStyle: .alert)
        
        ac.addTextField { (textField) in
            textField.placeholder = "Trainer first name"
        }
        
        ac.addTextField { (textField) in
            textField.placeholder = "Trainer last name"
        }
        
        ac.addTextField { (textField) in
            textField.placeholder = "Phone number"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action:UIAlertAction) in
            
            let tfTrainerName = ac.textFields![0] as UITextField
            UserDefaults.standard.set(tfTrainerName.text, forKey: "Trainer_first_name")
            
            let tfTrainerLastName = ac.textFields![1] as UITextField
            UserDefaults.standard.set(tfTrainerLastName.text, forKey: "Trainer_last_name")
            
            let tfTrainerPhone = ac.textFields![2] as UITextField
            UserDefaults.standard.set(tfTrainerPhone.text, forKey: "Phone_number")

            //Post function here
            self.postTrainerAPI(first_name: tfTrainerName.text!, last_name: tfTrainerLastName.text!, phone_number: tfTrainerPhone.text!)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(addAction)
        ac.addAction(cancelAction)
        present(ac, animated: true)
    }
    
    private func callNumber(phoneNumber: String) {
      if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
    }
    
}

extension TrainerViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainer?.trainers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "trainer_cell")!
        
        cell.textLabel?.text = "\(trainer!.trainers[index].first_name ) \(trainer!.trainers[index].last_name)"
        cell.detailTextLabel?.text = trainer?.trainers[index].phone_number
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let trainer = trainer {
            callNumber(phoneNumber: trainer.trainers[indexPath.row].phone_number)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.trainer?.trainers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            deleteTrainerItemAPI(id: indexPath.row)
            trainerTableView.reloadData()
            
            
        }
        
    }
}
