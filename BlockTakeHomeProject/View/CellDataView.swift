//
//  CellDataView.swift
//  BlockTakeHomeProject
//
//  Created by JohnPaul Izibili on 2024-09-04.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

final class CellDataView: UIView {
    
    let imageHolder = UIImageView()
    let employeeName = UILabel()
    let employeeUUID = UILabel()
    let emailAddress = UILabel()
    let employeeTeam = UILabel()
    let employeeType = UILabel()
    
    let completeCellDataView = UIStackView()
    let detailsView = UIStackView()
    
    var cellViewData: EmployeeDataCellViewModel? {
        didSet {
            employeeName.text = cellViewData?.fullName
            employeeUUID.text = cellViewData?.uuid
            emailAddress.text = cellViewData?.emailAddress
            employeeTeam.text = cellViewData?.team
            employeeType.text = cellViewData?.employeeType
            
            let url = URL(string: cellViewData?.imageUrl ?? "")
            imageHolder.kf.setImage(with: url, placeholder: UIImage(named: "placeHolder"), options: nil, completionHandler: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCellDataView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCellDataView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        style()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        style()
    }
    
    func createCellDataView() {
        completeCellDataView.axis = .horizontal
        completeCellDataView.spacing = 20
        
        detailsView.axis = .vertical
        detailsView.distribution = .fillEqually
        detailsView.spacing = 3
        
        detailsView.addArrangedSubview(employeeName)
        detailsView.addArrangedSubview(employeeUUID)
        detailsView.addArrangedSubview(emailAddress)
        detailsView.addArrangedSubview(employeeTeam)
        detailsView.addArrangedSubview(employeeType)
        
        completeCellDataView.addArrangedSubview(imageHolder)
        completeCellDataView.addArrangedSubview(detailsView)
        
        addSubview(completeCellDataView)
        completeCellDataView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(120)
        }
    }
    
    func style() {
        completeCellDataView.backgroundColor = .systemBackground
        completeCellDataView.isLayoutMarginsRelativeArrangement = true
        completeCellDataView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        imageHolder.layer.borderWidth = 1.0
        imageHolder.backgroundColor = .lightGray
        imageHolder.layer.cornerRadius = 5.0
        imageHolder.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(100)
        }
        imageHolder.snp.contentCompressionResistanceHorizontalPriority = .leastNonzeroMagnitude
        imageHolder.snp.contentCompressionResistanceVerticalPriority = .leastNonzeroMagnitude
        imageHolder.contentMode = .scaleAspectFit
        imageHolder.clipsToBounds = true
        
        [employeeName, employeeUUID, emailAddress, employeeTeam, employeeType].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(20)
            }
            $0.font = .boldSystemFont(ofSize: 15)
            $0.numberOfLines = 0
            $0.textAlignment = .left
            $0.setContentHuggingPriority(.required, for: .vertical)
            $0.textColor = .label
            $0.backgroundColor = .clear
            $0.adjustsFontSizeToFitWidth = true
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

