//
//  Book.swift
//  ReadMe
//
//  Created by Omar Brambilla on 06.12.20.
//  Copyright © 2020 Omar Brambilla. All rights reserved.
//

import Foundation
import UIKit

struct Book {
    let title: String
    let author: String
    
    var image: UIImage {
        Library.loadImage(forBook: self)
        ?? LibrarySymbol.letterSquare(letter: title.first).image
    }
}
