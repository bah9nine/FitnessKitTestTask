//
//  ClassesTimetableProtocol.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import Foundation

protocol ClassesScheduleSProtocol {
    func fetchSchedule(completionHandler: @escaping ([[Activity]]?, Error?) -> ())
}
