//
//  DataModel.swift
//  BlockTakeHomeProject
//
//  Created by JohnPaul Izibili on 2024-09-04.
//

import Foundation

struct Employee: Codable, Equatable {
    var employees: [EmployeeData]
}

struct EmployeeData: Codable, Equatable {
    var uuid: String
    var fullName: String
    var emailAddress: String
    var team: String
    var employeeType: String
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case fullName = "full_name"
        case emailAddress = "email_address"
        case team
        case employeeType = "employee_type"
        case imageUrl = "photo_url_small"
    }
}
