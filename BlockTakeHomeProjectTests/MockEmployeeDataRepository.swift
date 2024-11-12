//
//  MockEmployeeDataRepository.swift
//  BlockTakeHomeProjectTests
//
//  Created by JohnPaul Izibili on 2024-09-06.
//

import Foundation
import XCTest
@testable import BlockTakeHomeProject

class MockEmployeeDataRepository: EmployeeDirectoryRepository {
    
    var didCallEmployeeData: Bool = false
    var setCompletionForEmployee: Result<[EmployeeData], AppError>?
    
    func fetchEmployeeData(completion: @escaping (Result<[EmployeeData], AppError>) -> Void) {
        didCallEmployeeData = true
        completion(setCompletionForEmployee!)
    }
}
