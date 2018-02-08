//
//  Data.swift
//  ToDo
//
//  Created by Tokhtar Yelemessov on 2/8/18.
//  Copyright © 2018 Tokhtar Yelemessov. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var age : Int = 0
}
