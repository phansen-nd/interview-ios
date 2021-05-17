//
//  WeekView.swift
//  Interview
//
//  Created by Chris Anderson on 5/17/21.
//

import UIKit

class WeekView: UIStackView {
    convenience init(days: [Day?]) {
        self.init()

        self.distribution = .fillEqually
        self.axis = .horizontal

        for day in days {
            self.addArrangedSubview(DayView(day: day))
        }
    }
}
