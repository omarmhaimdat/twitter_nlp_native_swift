//
//  Model.swift
//  twitter_nlp
//
//  Created by M'haimdat omar on 21-01-2020.
//  Copyright © 2020 M'haimdat omar. All rights reserved.
//

import Foundation
import UIKit

struct Model {
    var text: String
    var color: UIColor
    var query: String
    
    init(text: String, color: UIColor, query: String) {
        self.text = text
        self.color = color
        self.query = query
    }
}
