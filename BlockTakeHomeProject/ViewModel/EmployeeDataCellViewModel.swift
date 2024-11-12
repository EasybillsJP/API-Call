//
//  EmployeeDataCellViewModel.swift
//  BlockTakeHomeProject
//
//  Created by JohnPaul Izibili on 2024-09-04.
//

import Foundation
import UIKit

protocol EmployeeViewModelDelegate {
    
    func showLoader(didShow: Bool)
    func showError(message: String)
}

class EmployeeDataCellViewModel: NSObject {
    
    internal init(uuid: String, fullName: String, emailAddress: String, team: String, employeeType: String, imageUrl: String) {
        self.uuid = uuid
        self.fullName = fullName
        self.emailAddress = emailAddress
        self.team = team
        self.employeeType = employeeType
        self.imageUrl = imageUrl
    }
    
    var uuid: String
    var fullName: String
    var emailAddress: String
    var team: String
    var employeeType: String
    var imageUrl: String
    
//    var delegate: EmployeeViewModelDelegate?
//    let employeeDetailsData : EmployeeDirectoryRepository
//    var collectionCellData: [EmployeeData] = []
//    let pullToRefresh = UIRefreshControl()
    
//    func loadData() {
//        delegate?.showLoader(didShow: true)
//        pullToRefresh.beginRefreshing()
//        
//        employeeDetailsData.fetchEmployeeData { [weak self] result in
//            switch result {
//            case .success(let employeeDetails):
//                self?.collectionCellData = employeeDetails
//                //self?.collectionView.reloadData()
//                self?.pullToRefresh.endRefreshing()
//            case .failure(let error):
//                self?.delegate?.showError(message: error.description)
//                //self?.displayError(messsage: error.description)
//            }
//        }
//    }
}

extension EmployeeData {
    func asCellViewModel() -> EmployeeDataCellViewModel {
        let formattedType = employeeType.replacingOccurrences(of: "_", with: " ")
        
        return EmployeeDataCellViewModel.init(uuid: uuid, fullName: fullName, emailAddress: emailAddress, team: team, employeeType: formattedType, imageUrl: imageUrl)
    }
}
