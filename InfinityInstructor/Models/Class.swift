//
//  Class.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation

class Class : Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var units : [Unit]
    
    init(id: Int, name: String, description : String, units : [Unit]) {
        self.id = id
        self.name = name
        self.description = description
        self.units = units
    }
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case description
        case units
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(units, forKey: .units)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        units = try values.decode([Unit].self, forKey: .units)

    }
}
