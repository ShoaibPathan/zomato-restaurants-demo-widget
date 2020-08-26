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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RestaurantCell", bundle: nil), forCellReuseIdentifier: "RestaurantCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        setTableViewDataSourceDelegate(viewController: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        setTableViewDataSourceDelegate(viewController: nil)
    }
    
    func setTableViewDataSourceDelegate(viewController: ViewController?) {
        tableView.dataSource = viewController
        tableView.delegate = viewController
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as? RestaurantCell else {
            return UITableViewCell()
        }
        cell.setTitle(name: "Hello I'm a restaurant", location: "This is my location", type: "Types", subtypes: "Type 1, Type 2, Type 3")
//        cell.titleLabel.attributedText =  getAttributedString(string: "Hello I'm a cell \nThis is the new line \nthis is another new line")
        cell.rightLabel.attributedText = getAttributedString(string: "1.9")
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
