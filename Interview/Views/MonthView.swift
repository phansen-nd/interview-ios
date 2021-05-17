//
//  MonthView.swift
//  Interview
//
//  Created by Chris Anderson on 5/17/21.
//

import UIKit

// TODO: Finish the "load" method
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

        // TODO: Create WeekView's for the given month
    }

    private func setup() {
        self.axis = .vertical
        self.spacing = 10
    }
}
