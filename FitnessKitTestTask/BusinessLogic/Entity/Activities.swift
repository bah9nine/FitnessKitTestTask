//
//  Activites.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import Foundation

struct Activities: Decodable, Encodable {
    let activities: [Activity]
    
    enum CodingKeys: String, CodingKey {
        case activites = "lessons"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.activities = try container.decode([Activity].self, forKey: .activites)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(activities, forKey: .activites)
    }
}
