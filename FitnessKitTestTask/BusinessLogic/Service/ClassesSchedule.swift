//
//  ClassesTimetable.swift
//  FitnessKitTestTask
//
//  Created by Иван Миронов on 02.04.2022.
//

import Foundation
import Alamofire

class ClassesSchedule: ClassesScheduleSProtocol {
    private let url = "https://olimpia.fitnesskit-admin.ru/schedule/get_v3/?club_id=2"
    
    func fetchSchedule(completionHandler: @escaping ([[Activity]]?, Error?) -> Void) {
        AF.request(url).validate().response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        let coaches = try JSONDecoder().decode(Coaches.self, from: data).coaches
                        let activites = try JSONDecoder().decode(Activities.self, from: data).activities
                        let activitesWithCoaches = self.appoint(coaches: coaches, to: activites)
                        let sortedActivities = self.sorted(activities: activitesWithCoaches)
                        completionHandler(sortedActivities, nil)
                    } catch {
                        completionHandler(nil,SystemErrors.fetchDataError)
                    }
                }
            case .failure(let error):
                completionHandler(nil,SystemErrors.requestError(error))
            }
        }
    }
    
    private func appoint(coaches: [Coach], to activities: [Activity]) -> [Activity] {
        var tempArray = activities
        
        for i in 0..<tempArray.count {
            let coachId = tempArray[i].coachId
            let coach = coaches.first { coach in
                return coach.id == coachId
            }
            
            if let coach = coach {
                tempArray[i].appoint(coach: coach)
            }
            tempArray[i].dateFromat()
        }
        return tempArray
    }
    
    private func sortByTime(actvities: [[Activity]]) -> [[Activity]] {
        var tempActivites = actvities
        for i in 0..<tempActivites.count {
            tempActivites.sort { arrayOne, arrayTwo in
                return arrayOne[1].date < arrayTwo[1].date
            }
            
            tempActivites[i].sort { activityOne, activityTwo in
                return activityOne.startTime < activityTwo.startTime
            }
        }
        return tempActivites
    }
    
    private func sorted(activities: [Activity]) -> [[Activity]] {
        var temp: [[Activity]] = []

        for i in 0..<activities.count {
            if let index = temp.firstIndex(where: { array in
                return array[0].date == activities[i].date
            }) {
                temp[index].append(activities[i])
            } else {
                temp.append([activities[i]])
            }
        }
       return sortByTime(actvities: temp)
    }
}
