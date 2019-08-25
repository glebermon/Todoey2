//
//  Category.swift
//  Todoey2
//
//  Created by Глеб on 25/08/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    
    let items = List<Item>()
}
