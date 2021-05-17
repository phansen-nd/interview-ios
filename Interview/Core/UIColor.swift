//
//  UIColor.swift
//  Interview
//
//  Created by Chris Anderson on 5/17/21.
//

import UIKit

extension UIColor {

    static var grey: UIColor = .init(named: "grey")
    static var purple: UIColor = .init(named: "purple")
    static var green: UIColor = .init(named: "green")
    static var paleGreen: UIColor = .init(named: "paleGreen")

    convenience init(named: String) {
        self.init(
            named: named,
            in: Bundle(for: AppDelegate.self),
            compatibleWith: nil
        )!
    }
}
