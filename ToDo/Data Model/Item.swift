//
//  Item.swift
//  ToDo
//
//  Created by Tokhtar Yelemessov on 2/8/18.
//  Copyright © 2018 Tokhtar Yelemessov. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")

}
