//
//  Classes.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import Foundation
import UIKit

struct Activity: Codable {
    let className: String
    var coach: Coach?
    let coachId: String
    let place: String
    var date: String
    let startTime: String
    let endTime: String
    let activityColor: String
    
    enum CodingKeys: String, CodingKey {
        case className = "tab"
        case coachId = "coach_id"
        case place
        case date
        case startTime
        case endTime
        case activityColor = "color"
    }
    
    mutating func appoint(coach: Coach) {
        self.coach = coach
    }
    
    mutating func dateFromat() {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "d MMMM"

        if let date = dateFormatterGet.date(from: date) {
            self.date = dateFormatterPrint.string(from: date)
        }
    }
}
