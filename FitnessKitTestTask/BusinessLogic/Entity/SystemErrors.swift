//
//  SystemErrors.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 03.04.2022.
//

import Foundation

enum SystemErrors: LocalizedError {
    case fetchDataError
    case requestError(Error)
    
    var errorDescription: String? {
        switch self {
        case .fetchDataError: return "Error: cannot fatch data"
        case .requestError(let error): return "Error: Request error \(error)"
        }
    }
}
