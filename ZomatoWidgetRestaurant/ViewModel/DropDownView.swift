//
//  DropDownView.swift
//  ZomatoWidgetRestaurant
//
//  Created by Amirthy Tejeshwar on 02/09/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//

import UIKit

class DropDownView: UITableViewHeaderFooterView {
    
//    var dropDown: DropDown = DropDown(frame: .zero)
    var heightConstraint = NSLayoutConstraint()
    var label = UILabel(frame: .zero)
    var isOpen = true
    var didTapSearchButton: (()->Void)?
    
    @IBOutlet weak var dropDownLabel: UILabel!
    @IBOutlet weak var dropDownBackgroundView: UIView!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchButtonWidthConstraint: NSLayoutConstraint!
    @IBAction func dropDownAction(_ sender: Any) {
        
    }
    @IBAction func searchButtonAction(_ sender: Any) {
        // implement api call and get list
        self.didTapSearchButton?()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//protocol DropDownDelegate {
//    func optionSelected(category: Categories)
//}
//
//extension DropDownView: DropDownDelegate {
//    func optionSelected(category: Categories) {
//        self.toggleDropDown()
//        var color: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
//        if category.name == "--select--" {
//            color = .lightGray
//            changeOpacitySearch(opacity: 1.0, userInteraction: true)
//            self.delegate?.optionSelected(category: category)
//        } else {
//            changeOpacitySearch(opacity: 0.5, userInteraction: false)
//        }
//        self.dropDownLabel.attributedText = NSAttributedString(string: category.name ?? "Category", attributes: [
//            NSAttributedString.Key.foregroundColor: color
//        ])
//        self.delegate?.optionSelected(category: category)
//    }
//
//    func changeOpacitySearch(opacity: Float, userInteraction: Bool) {
//        textField.layer.opacity = opacity
//        searchButton.layer.opacity = opacity
//        textField.isUserInteractionEnabled = userInteraction
//        searchButton.isUserInteractionEnabled = userInteraction
//    }
//}
