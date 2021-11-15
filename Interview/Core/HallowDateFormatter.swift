//
//  HallowDateFormatter.swift
//  Interview
//
//  Created by Pat Hansen on 11/15/21.
//

import Foundation

extension DateFormatter {
    
    static let hallowDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    
}
