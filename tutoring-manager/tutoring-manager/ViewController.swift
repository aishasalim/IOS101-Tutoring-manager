//
//  ViewController.swift
//  tutoring-manager
//
//  Created by Aisha Salimgereyeva on 4/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var blueCardView: UIView!
    @IBOutlet weak var redCardView: UIView!
    @IBOutlet weak var grayCardView: UIView!
    @IBOutlet weak var greenCardView: UIView!
    
    @IBOutlet weak var activeStudentsNumber: UILabel!
    @IBOutlet weak var withdravalStudentsNumber: UILabel!
    @IBOutlet weak var leadsStudentsNumber: UILabel!
    @IBOutlet weak var potentiallyReturningStudentsNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Today's date display
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        formatter.locale = Locale(identifier: "en_US")
        let dateString = formatter.string(from: today)
        dateLabel.text = dateString
        
        // Apply styling to card views
        applyCardStyle(to: blueCardView, color: UIColor(red: 72/255, green: 148/255, blue: 254/255, alpha: 1.0))
        applyCardStyle(to: redCardView, color: UIColor(red: 245/255, green: 115/255, blue: 98/255, alpha: 1.0))
        applyCardStyle(to: greenCardView, color: UIColor(red: 86/255, green: 214/255, blue: 153/255, alpha: 1.0))
        applyCardStyle(to: grayCardView, color: UIColor.lightGray)
    }
    
    func applyCardStyle(to cardView: UIView, color: UIColor) {
        // Set background color
        cardView.backgroundColor = color
        cardView.layer.cornerRadius = 10
        
        // Add shadow
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardView.layer.shadowRadius = 4
        cardView.layer.masksToBounds = false
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        // This function is empty as it's just used to unwind to this view controller.
    }
}


