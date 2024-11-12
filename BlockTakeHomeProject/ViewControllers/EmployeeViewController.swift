//
//  EmployeeViewController.swift
//  BlockTakeHomeProject
//
//  Created by JohnPaul Izibili on 2024-09-04.
//

import UIKit
import SnapKit

class EmployeeViewController: UIViewController {
    
    let cellIdentifier = "EmployeeCollectionViewCell"
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    var collectionCellData: [EmployeeData] = []
    let employeeDetailsData : EmployeeDirectoryRepository
    //let viewModel: EmployeeDataCellViewModel
    
    let pullToRefresh = UIRefreshControl()
    
    init(employeeDetailsData : EmployeeDirectoryRepository = NetworkEmployeeDirectoryRepository()) {
        self.employeeDetailsData = employeeDetailsData
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.refreshControl = pullToRefresh
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionView.backgroundColor = .red
        collectionView.register(EmployeeCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        pullToRefresh.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
        loadData()
    }
    
    func loadData() {
        pullToRefresh.beginRefreshing()

        employeeDetailsData.fetchEmployeeData { [weak self] result in
            switch result {
            case .success(let employeeDetails):
                self?.collectionCellData = employeeDetails
                self?.collectionView.reloadData()
                self?.pullToRefresh.endRefreshing()
            case .failure(let error):
                self?.pullToRefresh.endRefreshing()
                self?.displayError(messsage: error.description)
            }
        }
    }
    
    @objc private func didPullToRefresh(_ sender: Any) {
        loadData()
    }
    
    func displayError(messsage: String) {
        let alert = UIAlertController(title: "Alert", message: messsage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension EmployeeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! EmployeeCollectionViewCell
        let cellData = collectionCellData[indexPath.row]
        cell.parentCell.cellViewData = cellData.asCellViewModel()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        return header
    }
    
    func createLayout() -> UICollectionViewLayout {
        let itemAndGroupHeight: CGFloat = 200
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(itemAndGroupHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 30, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(itemAndGroupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 30
        section.boundarySupplementaryItems = [sectionHeader]
        return UICollectionViewCompositionalLayout(section: section)
    }
}
