//
//  HeaderCollectionReusableView.swift
//  BlockTakeHomeProject
//
//  Created by JohnPaul Izibili on 2024-09-04.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.textAlignment = .center
        headerLabel.font = .boldSystemFont(ofSize: 20)
        return headerLabel
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(headerLabel)
        headerLabel.text = "EMPLOYEES DIRECTORY"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backgroundColor = .clear
        addSubview(headerLabel)
    }
}
