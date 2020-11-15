//
//  User.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/29/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation

class OnlineUser : Codable  {
    var name: String
    var classes: [Class]
    
    init(name: String, classes: [Class]) {
        self.name = name
        self.classes = classes
    }
    enum CodingKeys : String, CodingKey {
        case name
        case classes
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(classes, forKey: .classes)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        classes = try values.decode([Class].self, forKey: .classes)
    }
}
