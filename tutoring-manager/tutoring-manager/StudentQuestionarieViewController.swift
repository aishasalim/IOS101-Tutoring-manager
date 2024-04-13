//
//  StudentQuestionarieViewController.swift
//  tutoring-manager
//
//  Created by Aisha Salimgereyeva on 4/12/24.
//

import UIKit
import Foundation

class StudentQuestionarieViewController: UIViewController {
    
    
    @IBOutlet weak var StudentNameTextField: UITextField!
    @IBOutlet weak var ParentNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var ParentPhoneTextField: UITextField!
    @IBOutlet weak var SubmitButton: UIButton!
    @IBOutlet weak var GradeTextField: UITextField!
    @IBOutlet weak var ProgramTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Customize text fields
        customizeTextField(StudentNameTextField)
        customizeTextField(ParentNameTextField)
        customizeTextField(EmailTextField)
        customizeTextField(ParentPhoneTextField)
        customizeTextField(GradeTextField)
        customizeTextField(ProgramTextField)
        
        // Add action to SubmitButton
        SubmitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)

    }
    
    func customizeTextField(_ textField: UITextField) {
        // Set background color to E8E8E8
        textField.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1.0)
    }
    
    @objc func submitButtonPressed() {
        guard let studentName = StudentNameTextField.text, !studentName.isEmpty,
              let parentName = ParentNameTextField.text, !parentName.isEmpty,
              let parentPhone = ParentPhoneTextField.text, !parentPhone.isEmpty else {
            // Alert user to fill in required fields
            // You can implement this part as per your UI/UX design
            print("Please fill in all required fields.")
            return
        }
        
        // Creating a Student instance
        let student = Student(name: studentName,
                              grade: GradeTextField.text,
                              program: ProgramTextField.text,
                              parentName: parentName,
                              parentPhone: parentPhone,
                              parentEmail: EmailTextField.text)
        
        do {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsDirectory.appendingPathComponent("students.json")
            
            // Load existing students or create an empty array
            var students: [Student]
            if FileManager.default.fileExists(atPath: fileURL.path) {
                let jsonData = try Data(contentsOf: fileURL)
                students = try JSONDecoder().decode([Student].self, from: jsonData)
            } else {
                students = []
            }
            
            // Add the new student
            students.append(student)
            
            // Encode the array of students and save to file
            let encodedData = try JSONEncoder().encode(students)
            try encodedData.write(to: fileURL)
            
            // Clear text fields
            clearTextFields()
            
            print("Document Directory: \(documentsDirectory)")
            
            print("Student data encoded and saved to: \(fileURL)")
            
        } catch {
            print("Error encoding or saving student data: \(error)")
        }
    }

    func clearTextFields() {
        StudentNameTextField.text = ""
        ParentNameTextField.text = ""
        EmailTextField.text = ""
        ParentPhoneTextField.text = ""
        GradeTextField.text = ""
        ProgramTextField.text = ""
    }
}
