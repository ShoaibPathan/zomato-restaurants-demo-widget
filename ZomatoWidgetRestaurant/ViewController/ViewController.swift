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
    
    var restaurantList: [RestaurantModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDataSourceDelegate(viewController: self)
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "RestaurantCell", bundle: nil), forCellReuseIdentifier: "RestaurantCell")
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
        return restaurantList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as? RestaurantCell else {
            return UITableViewCell()
        }
        let restaurantModel: RestaurantModel = restaurantList[indexPath.row]
        cell.setTitle(name: restaurantModel.restaurant?.name ?? "Restaurant Name", location: restaurantModel.restaurant?.location?.localityVerbose, type: restaurantModel.restaurant?.establishments?.first, subtypes: restaurantModel.restaurant?.cuisines)
        cell.setupRightLabel(reviewCount: restaurantModel.restaurant?.allReviewCount)
        cell.setImage(imageUrl: restaurantModel.restaurant?.thumb)
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {

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
