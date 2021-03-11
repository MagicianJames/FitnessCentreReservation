//
//  NotificationCenter.swift
//  GJFitness
//
//  Created by Krittamet Chuwongworaphinit on 12/2/2564 BE.
//

import Foundation

extension Notification.Name {
    static let roomCellClicked = Notification.Name(rawValue: "roomCellClicked")
    static let timeCellClicked = Notification.Name(rawValue: "timeCellClicked")
    static let roomClickedOnlyOnce = Notification.Name(rawValue: "roomClickedOnlyOnce")
    static let editRoomClickedOnlyOnce = Notification.Name(rawValue: "editClickedOnlyOnce")

    static let roomCellClickedED = Notification.Name(rawValue: "roomCellClickedED")

}
