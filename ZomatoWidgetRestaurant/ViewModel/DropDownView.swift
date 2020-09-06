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
    var didTapSearchButton: (()->Void)?
    var delegate: DropDownDelegate?
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        //location is relative to the current view
        // do something with the touched point
        if touch?.view == dropDownBackgroundView || isOpen {
            toggleDropDown()
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.superview?.addSubview(dropDown)
        self.superview?.bringSubviewToFront(dropDown)
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        dropDown.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        dropDown.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        dropDown.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2 - 30).isActive = true
        heightConstraint = dropDown.heightAnchor.constraint(equalToConstant: 0)
    }
    
    func toggleDropDown() {
        if isOpen {
            isOpen = false
            NSLayoutConstraint.deactivate([heightConstraint])
            var height: CGFloat = UIScreen.main.bounds.height/3
            if height > dropDown.tableView.contentSize.height {
                height = dropDown.tableView.contentSize.height
            }
            self.superview?.bringSubviewToFront(dropDown)
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
    func optionSelected(category: Categories)
}

extension DropDownView: DropDownDelegate {
    func optionSelected(category: Categories) {
        self.toggleDropDown()
        var color: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        if category.name == "--select--" {
            color = .lightGray
            changeOpacitySearch(opacity: 1.0, userInteraction: true)
            self.delegate?.optionSelected(category: category)
        } else {
            changeOpacitySearch(opacity: 0.5, userInteraction: false)
        }
        self.dropDownLabel.attributedText = NSAttributedString(string: category.name ?? "Category", attributes: [
            NSAttributedString.Key.foregroundColor: color
        ])
        self.delegate?.optionSelected(category: category)
    }
    
    func changeOpacitySearch(opacity: Float, userInteraction: Bool) {
        textField.layer.opacity = opacity
        searchButton.layer.opacity = opacity
        textField.isUserInteractionEnabled = userInteraction
        searchButton.isUserInteractionEnabled = userInteraction
    }
}
