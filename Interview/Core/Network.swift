//
//  Network.swift
//  Interview
//
//  Created by Chris Anderson on 4/15/21.
//

import Foundation
import Alamofire

struct Network {
    
    var dataDecoder = JSONDecoder()

    mutating func getContent(completion: @escaping (Result<[Month], Error>) -> Void) {
        dataDecoder.dateDecodingStrategy = .formatted(DateFormatter.hallowDateFormatter)
        
        AF.request("https://hallow.com/interview/activity.json", method: .get)
            .responseDecodable(of: [Day].self, decoder: dataDecoder) { response in
                if let error = response.error {
                    completion(.failure(error))
                }

                if let days = response.value {
                    
                    var firstOfMonth = days[0]
                    var monthDays: [Day] = []
                    var months: [Month] = []
                    
                    for day in days {
                        if !day.date.isInSameMonth(date: firstOfMonth.date) {
                            months.append(Month(date: firstOfMonth.date, days: monthDays))
                            
                            firstOfMonth = day
                            monthDays = []
                        }
                        monthDays.append(day)
                    }
                    
                    if monthDays.count > 0 {
                        months.append(Month(date: firstOfMonth.date, days: monthDays))
                    }
                    
                    completion(.success(months))
                }
        }
    }
}
