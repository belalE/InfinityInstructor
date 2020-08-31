//
//  Test.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation

class Test : Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var value : Int
    var date: Date
    var sets: [StudySet]
    
    init(id: Int, name: String, description : String, value : Int, date : Date, sets : [StudySet]) {
        self.id = id
        self.name = name
        self.description = description
        self.value = value
        self.date = date
        self.sets = sets
    }
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case description
        case value
        case date
        case sets
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(value, forKey: .value)
        try container.encode(date, forKey: .date)
        try container.encode(sets, forKey: .sets)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        value = try values.decode(Int.self, forKey: .value)
        date = try values.decode(Date.self, forKey: .date)
        sets = try values.decode([StudySet].self, forKey: .sets)
    }
}

