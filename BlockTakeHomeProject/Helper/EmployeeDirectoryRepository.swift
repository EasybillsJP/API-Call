//
//  EmployeeDirectoryRepository.swift
//  BlockTakeHomeProject
//
//  Created by JohnPaul Izibili on 2024-09-04.
//

import Foundation

protocol EmployeeDirectoryRepository {
    func fetchEmployeeData(completion: @escaping (Result<[EmployeeData], AppError>) -> Void)
}
