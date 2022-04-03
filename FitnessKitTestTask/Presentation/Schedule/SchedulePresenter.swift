//
//  SchedulePresenter.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import Foundation

class SchedulePresenter: ScheduleViewOutput {
    private unowned var view: ScheduleViewInput
    private var scheduleService: ClassesScheduleSProtocol?
    
    init(view: ScheduleViewInput) {
        self.view = view
        scheduleService = ClassesSchedule()
    }
    
    func viewIsReady() {
        view.setupInitialState()
        view.activityIndicatorStart()
        fetchData()
    }
    
    private func fetchData() {
        scheduleService?.fetchSchedule(completionHandler: {[weak self] activities, error in
            guard let self = self else { return }
            if let error = error {
                self.view.activityIndicatorStop()
                self.view.show(error: error)
            }
            if let activities = activities {
                self.view.reloadTableView(with: activities)
                self.view.activityIndicatorStop()
            }
        })
    }
}
