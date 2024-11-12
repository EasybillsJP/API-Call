//
//  BlockTakeHomeProjectTests.swift
//  BlockTakeHomeProjectTests
//
//  Created by JohnPaul Izibili on 2024-09-04.
//

import XCTest
@testable import BlockTakeHomeProject

class BlockTakeHomeProjectTests: XCTestCase {
    
    var sut: EmployeeViewController!
    var mockEmployeeDataRepository: MockEmployeeDataRepository!

    override func setUpWithError() throws {
        mockEmployeeDataRepository = MockEmployeeDataRepository()
        sut = EmployeeViewController(employeeDetailsData: mockEmployeeDataRepository)
    }

    override func tearDownWithError() throws {
        mockEmployeeDataRepository = nil
        sut = nil
    }
    
    func testDidCallFetchEmployeesSuccess() {
        //Given
        let employees = [EmployeeData(uuid: "iuytgh-dfghgf7dff-uygh78iuj", fullName: "JP Izibili", emailAddress: "jp@squared.com", team: "Mobile Dev", employeeType: "Full_Time", imageUrl: ""), EmployeeData(uuid: "test uuid", fullName: "test Name", emailAddress: "test@email.com", team: "test team", employeeType: "test type", imageUrl: "test url")]
        let result: Result<[EmployeeData], AppError> = .success(employees)
        
        let testData = result
        
        mockEmployeeDataRepository.setCompletionForEmployee = testData
        let expectation = XCTestExpectation(description: "wait expectation")
        
        //When
        sut.loadData()
        
        //Then
        XCTAssertTrue(mockEmployeeDataRepository.didCallEmployeeData)
        _ = XCTWaiter.wait(for: [expectation], timeout: 2)
        XCTAssertEqual(sut.collectionCellData.count, employees.count)
        XCTAssertEqual(sut.collectionCellData, employees)
    }
}
