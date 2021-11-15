//
//  Day.swift
//  Interview
//
//  Created by Chris Anderson on 4/15/21.
//

import Foundation

// TODO: Fill in required keys
struct Day: Decodable {
    let date: Date
    let isToday: Bool
    let hasSession: Bool
    let streak: StreakPart?
    
    private enum CodingKeys: String, CodingKey {
        case date
        case isToday = "is_today"
        case hasSession = "has_session"
        case streak
    }
    
}
