//
//  Trainer.swift
//  GJFitness
//
//  Created by James S on 8/3/2564 BE.
//

import Foundation
import ObjectMapper

class Trainer: Mappable {

    var trainers: [Trainers] = []
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        trainers <- map["trainers"]
    }
    
}
