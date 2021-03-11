//
//  ClassListViewController.swift
//  GJFitness
//
//  Created by James S on 9/2/2564 BE.

import UIKit
import Alamofire
import ObjectMapper

class ClassListViewController: UIViewController {
    @IBOutlet var classCollectionView: UICollectionView!
    @IBOutlet weak var createClass: UIButton!
    
    var all_classes: AllClasses? = nil
    let url = "https://b759807fe12e.ngrok.io/class"
    let urlDeleteClass = "https://b759807fe12e.ngrok.io/delete-all-class"
    
    @IBAction func CreateClass(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Admin", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CreateClassViewController") as? CreateClassViewController
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestClassAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        requestClassAPI()
    }
    
    func updateDataToUI() {
        classCollectionView.reloadData()
    }
    
    func requestClassAPI() {
        AF.request(url).responseString { (response) in
            if let value = response.value,
               let classResponse = Mapper<AllClasses>().map(JSONString: value) {
                self.all_classes = classResponse
                print(value)
                print(classResponse)
                self.updateDataToUI()
            }
        }
    }
    
    func deleteClass() {
        AF.request(urlDeleteClass).responseString { (response) in
            if let value = response.value,
               let classResponse = Mapper<AllClasses>().map(JSONString: value) {
                self.all_classes = classResponse
                print(value)
                print(classResponse)
                self.updateDataToUI()
            }
        }
    }
    
    @IBAction func deleteAll(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete All", message: "Do you confirm deleting all classes?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { action in
            //            self.items.removeAll()
            self.deleteClass()
            self.classCollectionView.reloadData()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

extension ClassListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return all_classes?.classes.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "class_list_cell", for: indexPath) as! ClassListCell
        
        let url = URL(string: (all_classes?.classes[index].picture_url)!)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        cell.classImageView.image = UIImage(data: data!)
        cell.className?.text = all_classes?.classes[index].class_name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 8
        
        let totalSpacing = (2 * 10) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.classCollectionView {
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width + 65)
        } else{
            return CGSize(width: 124, height: 171)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item at \(indexPath.section)/\(indexPath.item) tapped")
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Admin", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "TimeScheduleViewController") as? TimeScheduleViewController
        
        vc?.class_detail = (all_classes?.classes[indexPath.row])
        
        //        vc?.classImage = items[indexPath.row].classImage!
        self.present(vc!, animated: true, completion: nil)
        
    }
    
}
