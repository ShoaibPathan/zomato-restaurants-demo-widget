//
//  RestaurantCell.swift
//  ZomatoWidgetRestaurant
//
//  Created by Amirthy Tejeshwar on 26/08/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    func setTitle(name: String, location: String? = nil, type: String? = nil, subtypes: String? = nil) {
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont(name: "", size: 14) ??  UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.38)
        ]
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: name, attributes: attributes)
        if let location = location {
            attributedString.append(NSAttributedString(string: "\n"+location, attributes: attributes
            ))
        }
        if let type = type {
            attributedString.append(NSAttributedString(string: "\n"+type, attributes: [
                    NSAttributedString.Key.font: UIFont(name: "", size: 14) ??  UIFont.systemFont(ofSize: 14),
                    NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.99)
                ]
            ))
        }
        if let subtypes = subtypes {
            attributedString.append(NSAttributedString(string: ": " + subtypes, attributes: attributes
            ))
        }
        titleLabel.attributedText = attributedString
    }
}
