//
//  ScheduleIO.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import Foundation

protocol ScheduleViewInput: AnyObject {
    func setupInitialState()
    func reloadTableView(with activities: [[Activity]])
    func activityIndicatorStart()
    func activityIndicatorStop()
    func show(error: Error)
}

protocol ScheduleViewOutput {
    func viewIsReady()
}
