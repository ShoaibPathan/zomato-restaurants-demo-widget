//
//  DropDown.swift
//  ZomatoWidgetRestaurant
//
//  Created by Amirthy Tejeshwar on 02/09/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//

import UIKit

class DropDown: UIView {
    
    var tableView: UITableView = UITableView()
    var delegate: DropDownDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .lightGray
        tableView.allowsSelection = true
        self.addSubview(tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum TypesOfSearch: Int, CaseIterable {
        case search
        case categories
        
        var description: String {
            get {
                switch self {
                case .search:
                    return "search"
                default:
                    return "categories"
                }
            }
        }
    }
}

extension DropDown: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TypesOfSearch.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let label: UILabel = UILabel()
        label.text = TypesOfSearch.init(rawValue: indexPath.row)?.description
        cell.addSubview(label)
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("child tableView didSelect")
        guard let selectedOptionDesc = TypesOfSearch.init(rawValue: indexPath.row)?.description else {
            return
        }
        delegate?.optionSelected(option: selectedOptionDesc)
    }
}
