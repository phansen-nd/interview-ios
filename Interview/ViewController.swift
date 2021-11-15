//
//  ViewController.swift
//  Interview
//
//  Created by Chris Anderson on 4/15/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yearScrollView: UIScrollView!
    var network = Network()

    override func viewDidLoad() {
        super.viewDidLoad()

        network.getContent { result in
            switch result {
            case .success(let months):
                
                // Create a MonthView for each month.
                var monthViews: [MonthView] = []
                for month in months {
                    let monthView = MonthView()
                    monthView.load(month: month)
                    monthViews.append(monthView)
                }
                
                let yearView = YearView()
                yearView.load(monthViews: monthViews)
                self.yearScrollView.addSubview(yearView)
                
                // Format yearview in scroll view
                yearView.leftAnchor.constraint(equalTo: self.yearScrollView.leftAnchor).isActive = true
                yearView.widthAnchor.constraint(equalTo: self.yearScrollView.widthAnchor).isActive = true
                yearView.topAnchor.constraint(equalTo: self.yearScrollView.topAnchor).isActive = true
                self.yearScrollView.contentLayoutGuide.heightAnchor.constraint(equalTo: yearView.heightAnchor).isActive = true
                
            case .failure(let error):
                print("Error getting data from network: \(error)")
            }
        }
    }
}

