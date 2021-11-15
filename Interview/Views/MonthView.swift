//
//  MonthView.swift
//  Interview
//
//  Created by Chris Anderson on 5/17/21.
//

import UIKit

class MonthView: UIStackView {

    var month: Month?
    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }

    func load(month: Month) {
        self.month = month

        let label = UILabel()
        label.text = month.monthString
        label.textAlignment = .center
        label.textColor = .black
        addArrangedSubview(label)

        var weekDays: [Day?] = []
        
        for _ in 1..<month.firstWeekDay {
            weekDays.append(nil)
        }
        
        for day in month.days {
            weekDays.append(day)
            
            if day.date.weekday == 7 {
                let weekView = WeekView(days: weekDays)
                self.addArrangedSubview(weekView)
                weekDays = []
            }
        }
        // Add leftover days into last week.
        if weekDays.count > 0 {
            
            // Finish week out with nils.
            while weekDays.count < 7 {
                weekDays.append(nil)
            }
            
            let lastWeekView = WeekView(days: weekDays)
            self.addArrangedSubview(lastWeekView)
        }
    }

    private func setup() {
        self.axis = .vertical
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
