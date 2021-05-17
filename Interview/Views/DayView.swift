//
//  DayView.swift
//  Interview
//
//  Created by Chris Anderson on 5/17/21.
//

import UIKit

class DayView: UIView {

    static let smallSize: CGFloat = 10
    static let largeSize: CGFloat = 30

    let circleView = UIView()
    let streakView = UIView()

    var circleWidthConstraint: NSLayoutConstraint?
    var circleHeightConstraint: NSLayoutConstraint?

    var size: CGFloat = DayView.largeSize {
        didSet {
            circleHeightConstraint?.constant = size
            circleWidthConstraint?.constant = size
            circleView.layer.cornerRadius = size / 2
            circleView.layer.masksToBounds = true
        }
    }

    var day: Day?
    convenience init(day: Day?) {
        self.init()
        self.day = day
        self.setup()
    }

    func setup() {

        size = day?.hasSession == true
            ? Self.largeSize
            : Self.smallSize

        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: Self.largeSize + 10).isActive = true

        addSubview(streakView)
        addSubview(circleView)

        setupColors()

        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        circleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circleWidthConstraint = circleView.widthAnchor.constraint(equalToConstant: size)
        circleWidthConstraint?.isActive = true
        circleHeightConstraint = circleView.heightAnchor.constraint(equalToConstant: size)
        circleHeightConstraint?.isActive = true

        guard let streak = day?.streak else { return }
        streakView.translatesAutoresizingMaskIntoConstraints = false
        streakView.heightAnchor.constraint(equalToConstant: Self.largeSize).isActive = true
        streakView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        switch streak {
        case .start:
            streakView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
            streakView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        case .middle:
            streakView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            streakView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        case .end:
            streakView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
            streakView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        }
    }

    func setupColors() {
        guard let day = day else {
            circleView.backgroundColor = .clear
            return
        }

        let color: UIColor
        if day.hasSession { color = .green }
        else if day.isToday { color = .purple }
        else { color = .grey }

        circleView.backgroundColor = color
        streakView.backgroundColor = color
    }
}
