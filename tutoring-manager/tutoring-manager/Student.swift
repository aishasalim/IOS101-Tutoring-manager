//
//  Student.swift
//  tutoring-manager
//
//  Created by Aisha Salimgereyeva on 4/12/24.
//

import Foundation

struct Student: Codable { // Make Student Codable for encoding and decoding
    var name: String
    var grade: String?
    var program: String?
    var parentName: String
    var parentPhone: String
    var parentEmail: String?
    
    func encode(to fileURL: URL) throws {
        let encoder = JSONEncoder()
        let encodedData = try encoder.encode(self)
        try encodedData.write(to: fileURL)
    }
}
