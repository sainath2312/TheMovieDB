//
//  CustomTableViewCell.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 10/02/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    weak var delegate: NSObjectProtocol? = nil
    
    func configure(_ item: Any?) { }
    
}
