//
//  ViewController.swift
//  BlockTakeHomeProject
//
//  Created by JohnPaul Izibili on 2024-09-04.
//

import UIKit
import SnapKit

class EmployeeDetailsViewController: UIViewController {
    
    let employeeViewController = EmployeeViewController(employeeDetailsData: NetworkEmployeeDirectoryRepository())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeViewController.view.frame = self.view.bounds
        view.addSubview(employeeViewController.view)
        addChild(employeeViewController)
        employeeViewController.didMove(toParent: self)
    }
}
