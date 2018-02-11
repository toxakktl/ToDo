//
//  Category.swift
//  ToDo
//
//  Created by Tokhtar Yelemessov on 2/8/18.
//  Copyright © 2018 Tokhtar Yelemessov. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
