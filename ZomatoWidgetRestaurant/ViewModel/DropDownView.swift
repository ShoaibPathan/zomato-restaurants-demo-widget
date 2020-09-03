//
//  DropDownView.swift
//  ZomatoWidgetRestaurant
//
//  Created by Amirthy Tejeshwar on 02/09/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//

import UIKit

class DropDownView: UITableViewHeaderFooterView {
    
    var dropDown: DropDown = DropDown(frame: .zero)
    var heightConstraint = NSLayoutConstraint()
    var label = UILabel(frame: .zero)
    var isOpen = true
    let widthOfDropDown: CGFloat = 130
    var didTapSearchButton: (()->Void)?
    
    @IBOutlet weak var dropDownLabel: UILabel!
    @IBOutlet weak var dropDownBackgroundView: UIView!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchButtonWidthConstraint: NSLayoutConstraint!
    @IBAction func dropDownAction(_ sender: Any) {
        self.toggleDropDown()
    }
    @IBAction func searchButtonAction(_ sender: Any) {
        // implement api call and get list
        self.didTapSearchButton?()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.superview?.addSubview(dropDown)
        self.superview?.bringSubviewToFront(dropDown)
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        dropDown.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        dropDown.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        dropDown.widthAnchor.constraint(equalToConstant: widthOfDropDown).isActive = true
        heightConstraint = dropDown.heightAnchor.constraint(equalToConstant: 0)
    }
    
    func toggleDropDown() {
        if isOpen {
            isOpen = false
            NSLayoutConstraint.deactivate([heightConstraint])
            var height: CGFloat = 150
            if 150 > dropDown.tableView.contentSize.height{
                height = dropDown.tableView.contentSize.height
            }
            self.heightConstraint.constant = height
            NSLayoutConstraint.activate([heightConstraint])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropDown.layoutIfNeeded()
                self.dropDown.center.y += self.dropDown.frame.height/2
            })
        } else {
            isOpen = true
            NSLayoutConstraint.deactivate([heightConstraint])
            heightConstraint.constant = 0
            NSLayoutConstraint.activate([heightConstraint])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropDown.center.y -= self.dropDown.frame.height/2
                self.dropDown.layoutIfNeeded()
            })
        }
    }
}

protocol DropDownDelegate {
    func optionSelected(option: String)
}

extension DropDownView: DropDownDelegate {
    func optionSelected(option: String) {
        self.toggleDropDown()
        self.dropDownLabel.attributedText = NSAttributedString(string: option, attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ])
    }
}
