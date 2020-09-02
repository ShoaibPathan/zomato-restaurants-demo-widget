//
//  DropDownView.swift
//  ZomatoWidgetRestaurant
//
//  Created by Amirthy Tejeshwar on 02/09/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//

import UIKit

class DropDownView: UITableViewCell {
    
    var dropDown: DropDown = DropDown(frame: .zero)
    var heightConstraint = NSLayoutConstraint()
    var label = UILabel(frame: .zero)
    var isOpen = true
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.superview?.addSubview(dropDown)
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        dropDown.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropDown.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dropDown.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        heightConstraint = dropDown.heightAnchor.constraint(equalToConstant: 0)
    }
    
    func toggleDropDown() {
        if isOpen {
            isOpen = false
            NSLayoutConstraint.deactivate([heightConstraint])
            var height: CGFloat = dropDown.tableView.contentSize.height
            if dropDown.tableView.contentSize.height > 125 {
                height = 125
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

protocol DropDownSourceDelegate {
    func toggleDropDownCall()//(dropDownView: DropDownView)
}

extension DropDownView: DropDownSourceDelegate {
    func toggleDropDownCall() {
        self.toggleDropDown()
    }
}

protocol DropDownDelegate {
    func optionSelected(option: String)
}
