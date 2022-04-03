//
//  Coach.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import Foundation

struct Coach: Codable {
    let name: String
    let id: String
}

struct Coaches: Codable {
    let coaches: [Coach]
    
    enum CodingKeys: String, CodingKey {
        case coaches = "trainers"
    }
}
