//
//  Marca.swift
//  Fipe
//
//  Created by Kako Botasso on 07/04/17.
//  Copyright © 2017 Kako Botasso. All rights reserved.
//

import Foundation

class Marca {
    var name: String!
    var fipeName: String!
    var order: Int!
    var key: String!
    var id: Int!
    
    init(name: String, fipeName: String, order: Int, key: String, id: Int) {
        self.name = name
        self.fipeName = fipeName
        self.order = order
        self.key = key
        self.id = id
    }
}
