//
//  Trainers.swift
//  GJFitness
//
//  Created by James S on 8/3/2564 BE.
//

import Foundation
import ObjectMapper

class Trainers: Mappable {
    var id: Int = 0
    var first_name: String = ""
    var last_name: String = ""
    var phone_number: String = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        phone_number <- map["phone_number"]

    }
}
