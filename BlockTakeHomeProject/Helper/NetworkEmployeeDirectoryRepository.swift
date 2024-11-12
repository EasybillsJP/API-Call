//
//  NetworkEmployeeDirectoryRepository.swift
//  BlockTakeHomeProject
//
//  Created by JohnPaul Izibili on 2024-09-04.
//

import Foundation
import UIKit
import Alamofire

class NetworkEmployeeDirectoryRepository: EmployeeDirectoryRepository {
    var baseUrl: String = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    
    func fetchEmployeeData(completion: @escaping (Result<[EmployeeData], AppError>) -> Void) {
        guard Connectivity.isConnectedToInternet() else {
            completion(.failure(AppError.networkUnreachable))
            return
        }
        var employeeData: [EmployeeData] = []
        
        let requester = URLRequest(url: URL(string: baseUrl)!)
        AF.request(requester).uploadProgress { progress in
        }.response { responseData in
            guard let data = responseData.data else {return}
            do {
                let decodedData = try JSONDecoder().decode(Employee.self, from: data)
                employeeData = decodedData.employees
                print("employeeData is", employeeData)
                completion(.success(employeeData))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

