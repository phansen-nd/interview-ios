//
//  Date.swift
//  Interview
//
//  Created by Chris Anderson on 5/17/21.
//

import Foundation

extension Date {

    func addMonth(amount: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .month, value: amount, to: self)!
    }

    func addDay(amount: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .day, value: amount, to: self)!
    }

    func minusDay(amount: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .day, value: -1 * amount, to: self)!
    }

    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }

    func isInSameYear (date: Date) -> Bool { isEqual(to: date, toGranularity: .year) }
    func isInSameMonth(date: Date) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: date) == formatter.string(from: self)
    }
    func isInSameDay  (date: Date) -> Bool { isEqual(to: date, toGranularity: .day) }
    func isInSameWeek (date: Date) -> Bool { isEqual(to: date, toGranularity: .weekOfYear) }

    var isInThisYear: Bool { isInSameYear(date: Date()) }
    var isInThisMonth: Bool { isInSameMonth(date: Date()) }
    var isInThisWeek: Bool { isInSameWeek(date: Date()) }

    var isInYesterday: Bool { Calendar.current.isDateInYesterday(self) }
    var isInToday: Bool { Calendar.current.isDateInToday(self) }
    var isInTomorrow: Bool { Calendar.current.isDateInTomorrow(self) }

    var isInTheFuture: Bool { self > Date() }
    var isInThePast: Bool { self < Date() }

    var isInTodayUtc: Bool {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "MM/dd/yyyy"
        dateFormatter1.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter1.timeZone = TimeZone(identifier: "UTC")

        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "MM/dd/yyyy"
        dateFormatter2.locale = Locale(identifier: "en_US_POSIX")

        return dateFormatter1.string(from: self) == dateFormatter2.string(from: Date())
    }

    func localToUTC() -> Date {
        let timeZone = TimeZone(abbreviation: "UTC")!
        let targetOffset = TimeInterval(timeZone.secondsFromGMT(for: self))
        let localOffset = TimeInterval(TimeZone.autoupdatingCurrent.secondsFromGMT(for: self))

        return self.addingTimeInterval(localOffset - targetOffset)
    }

    func days(since date: Date) -> Int {
        let calendar = NSCalendar.current

        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)

        let components = calendar.dateComponents([.day], from: date2, to: date1)
        return components.day ?? 0
    }

    static func from(year: Int, month: Int = 1, day: Int = 1) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        let userCalendar = Calendar.current
        return userCalendar.date(from: dateComponents)!
    }

    func dayOfWeek() -> String {
        let weekdays = [
            "Sun",
            "Mon",
            "Tue",
            "Wed",
            "Thu",
            "Fri",
            "Sat"
        ]
        let component = Calendar.current.component(.weekday, from: self)
        return weekdays[component - 1]
    }

    var minutesFromNow: Int {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.minute], from: Date(), to: self)
        return components.minute ?? 0
    }

    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }

    var startOfWeek: Date {
        let gregorian = Calendar(identifier: .gregorian)
        return gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
    }

    var endOfWeek: Date {
        let gregorian = Calendar(identifier: .gregorian)
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        return gregorian.date(byAdding: .day, value: 7, to: sunday!)!
    }

    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
    }

    var lastDayOfMonth: Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.firstDayOfTheMonth)!
    }

    var daysInMonth: Int {
        let range = Calendar.current.range(of: .day, in: .month, for: firstDayOfTheMonth)!
        return range.count
    }
}
