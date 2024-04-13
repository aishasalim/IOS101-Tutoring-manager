//
//  ListOfStudentsViewController.swift
//  tutoring-manager
//
//  Created by Aisha Salimgereyeva on 4/12/24.
//

import UIKit


class ListOfStudentsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyStudentLabel: UILabel!
    var listOfStudents: [Student] = [] {
        didSet {
            // Update the visibility of the empty student label when the array changes
            emptyStudentLabel.isHidden = !listOfStudents.isEmpty
            // Reload table view when the data changes
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initially hide the empty student label
        emptyStudentLabel.isHidden = true
        
        // Set the data source for the table view
        tableView.dataSource = self
        
        // Load student data from JSON file
        loadStudentData()
    }
    
    // Function to load student data from JSON file
    func loadStudentData() {
        // Retrieve student data from JSON file
        if let url = Bundle.main.url(forResource: "students", withExtension: "json"),
           let jsonData = try? Data(contentsOf: url) {
            do {
                // Decode JSON data into an array of Student objects
                listOfStudents = try JSONDecoder().decode([Student].self, from: jsonData)
                
                // Print out student information
                for student in listOfStudents {
                    print("Student Name: \(student.name)")
                    print("Grade: \(student.grade ?? "N/A")")
                    print("Program: \(student.program ?? "N/A")")
                    print("Parent Name: \(student.parentName)")
                    print("Parent Phone: \(student.parentPhone)")
                    print("Parent Email: \(student.parentEmail ?? "N/A")")
                    print("-----------------------------------------")
                }
            } catch {
                print("Error decoding student data:", error)
            }
        } else {
            print("Error loading student JSON file.")
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        // Fetch student for the current row
        let student = listOfStudents[indexPath.row]
        
        // Configure cell with student data
        cell.textLabel?.text = student.name
        cell.detailTextLabel?.text = "Grade: \(student.grade ?? "N/A"), Program: \(student.program ?? "N/A")"
        
        return cell
    }
}
