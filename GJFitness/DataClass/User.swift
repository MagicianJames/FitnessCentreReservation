//
//  User.swift
//  GJFitness
//
//  Created by James S on 8/3/2564 BE.
//

import Foundation
import ObjectMapper

class User : Mappable {
    var id: Int = 0
    var first_name: String = ""
    var last_name: String = ""
    var username: String = ""
    var password: String = ""
    var email: String = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        username <- map["username"]
        password <- map["password"]
        email <- map["email"]

    }
    
}
