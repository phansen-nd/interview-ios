//
//  YearView.swift
//  Interview
//
//  Created by Pat Hansen on 11/15/21.
//

import UIKit

class YearView: UIStackView {

    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    private func setup() {
        self.axis = .vertical
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func load(monthViews: [MonthView]) {
        for monthView in monthViews {
            self.addArrangedSubview(monthView)
        }
    }
}
