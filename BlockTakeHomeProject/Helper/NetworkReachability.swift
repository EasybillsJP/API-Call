//
//  NetworkReachability.swift
//  BlockTakeHomeProject
//
//  Created by JohnPaul Izibili on 2023-03-09.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

enum AppError: Error {
    case networkUnreachable
    
    var description: String {
        switch self {
            
        case .networkUnreachable:
            return "Please check your internet connection and try again"
        }
    }
}
