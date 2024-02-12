//
//  MenuItem.swift
//  RestaurantMenu
//
//  Created by Darko Krstevski on 12.2.24.
//

import Foundation
import UIKit

class MenuItem {
    let name: String
    let image: UIImage
    let description: String
    
    init(image: String, name:String, description:String) {
        self.name = name
        self.image =  UIImage(named: image)!
        self.description = description
    }
}
