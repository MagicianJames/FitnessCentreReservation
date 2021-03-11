//
//  ClassEx.swift
//  GJFitness
//
//  Created by James S on 8/3/2564 BE.
//

import Foundation
import ObjectMapper

class ClassEx: Mappable {
    var id: Int = 0
    var class_name: String = ""
    var room_id: Int = 0
    var picture_url: String = ""
    var people_number: Int = 0
    var class_date: String = ""
    var schedule_time_id: Int = 0
    var trainer_id: Int = 0
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        class_name <- map["class_name"]
        room_id <- map["room_id"]
        picture_url <- map["picture_url"]
        people_number <- map["people_number"]
        class_date <- map["class_date"]
        schedule_time_id <- map["schedule_time_id"]
        trainer_id <- map["trainer_id"]

    }
}
