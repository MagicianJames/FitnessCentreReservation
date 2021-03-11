//
//  AllClasses.swift
//  GJFitness
//
//  Created by James S on 8/3/2564 BE.
//

import Foundation
import ObjectMapper

class AllClasses: Mappable {
    var classes: [ClassEx] = []
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        classes <- map["class_ex"]
    }
}
