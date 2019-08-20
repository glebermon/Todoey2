//
//  Item.swift
//  Todoey2
//
//  Created by Глеб on 20/08/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import Foundation

class Item: Encodable, Decodable {
    
    var title : String = ""
    
    var done : Bool = false
    
}
