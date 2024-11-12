//
//  CollectionViewCell.swift
//  BlockTakeHomeProject
//
//  Created by JohnPaul Izibili on 2024-09-04.
//

import Foundation
import UIKit
import SnapKit

final class EmployeeCollectionViewCell: UICollectionViewCell {
   let parentCell = CellDataView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(parentCell)
        parentCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        parentCell.translatesAutoresizingMaskIntoConstraints = false
        parentCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

