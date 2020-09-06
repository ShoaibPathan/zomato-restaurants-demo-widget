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
    
    func getRestaurants(categoryId: Int? = 1, searchParam: String? = nil) {
        var id = categoryId
        if searchParam == "" {
            id = 1
        }
        ZomatoApi().getSearchResponse(type: Search.self, categoryId: id, searchParam: searchParam) { (success, search, error) in
            if success, let restaurantList = search?.restaurants {
                self.restaurantList = restaurantList
                DispatchQueue.main.async {
                    self.reloadTableViewData()
                }
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
        headerView.dropDownBackgroundView.addBorder()
        headerView.delegate = self
        headerView.textField.delegate = self
        headerView.didTapSearchButton = {
            self.getRestaurants(categoryId: nil, searchParam: headerView.textField.text)
        }
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

extension ViewController: DropDownDelegate {
    func optionSelected(category: Categories) {
        guard let id = category.id else {
            return
        }
        getRestaurants(categoryId: id)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        getRestaurants(categoryId: nil, searchParam: textField.text)
        return true
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

extension UIView {
    func addBorder() {
        let borderWidth: CGFloat = 1

        frame = frame.insetBy(dx: -borderWidth, dy: -borderWidth)
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = borderWidth
    }
}
