//
//  ViewController.swift
//  ZomatoWidgetRestaurant
//
//  Created by Amirthy Tejeshwar on 26/08/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var headerView: DropDownView?
    var restaurantList: [RestaurantModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDataSourceDelegate(viewController: self)
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "RestaurantCell", bundle: nil), forCellReuseIdentifier: "RestaurantCell")
        tableView.register(UINib(nibName: "DropDownView", bundle: nil), forHeaderFooterViewReuseIdentifier: "DropDownView")
        getRestaurants()
    }
    
    func getRestaurants() {
        ZomatoApi().getSearchResponse(type: Search.self) { (success, search, error) in
            if success, let restaurantList = search?.restaurants {
                self.restaurantList = restaurantList
                self.reloadTableViewData()
            } else if error == nil {
                // handle empty restaurant list
            } else {
                // handle error case
            }
        }
    }
    
    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setTableViewDataSourceDelegate(viewController: ViewController?) {
        tableView.dataSource = viewController
        tableView.delegate = viewController
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurantList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = self.headerView {
            return headerView
        }
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DropDownView") as? DropDownView else {
            return UIView()
        }
        headerView.dropDown.delegate = headerView
        headerView.contentView.backgroundColor = .white
        self.headerView = headerView
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell for row at \(indexPath.row) and contentSize \(tableView.contentSize)")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as? RestaurantCell else {
            return UITableViewCell()
        }
        let restaurantModel: RestaurantModel = restaurantList[indexPath.row]
        cell.setTitle(name: restaurantModel.restaurant?.name ?? "Restaurant Name", location: restaurantModel.restaurant?.location?.localityVerbose, type: restaurantModel.restaurant?.establishments?.first, subtypes: restaurantModel.restaurant?.cuisines)
        cell.setupRightLabel(reviewCount: restaurantModel.restaurant?.allReviewCount)
        cell.setImage(imageUrl: restaurantModel.restaurant?.thumb)
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(cell.frame)
        print("willdisplay \(indexPath.row)")
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}



// ViewController Utility Methods

extension ViewController {
    
    func getAttributedString(string: String, fontName: String = "") -> NSAttributedString? {
        let attributedText: NSAttributedString = NSAttributedString(string: string, attributes: [
            NSAttributedString.Key.font: UIFont(name: "Arial", size: 15) ?? UIFont.systemFont(ofSize: 15)
        ])
        return attributedText
    }
    
}
