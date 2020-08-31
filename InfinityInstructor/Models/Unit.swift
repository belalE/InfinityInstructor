//
//  Unit.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation

class Unit : Identifiable {
    var id: Int
    var name: String
    var description: String
    var tests : [Test]
    var sets : [StudySet]
    
    init(id: Int, name: String, description : String, tests : [Test], sets : [StudySet]) {
        self.id = id
        self.name = name
        self.description = description
        self.tests = tests
        self.sets = sets
    }
    
}

//extension Unit : Codable {
//    enum CodingKeys : String, CodingKey {
//        case id
//        case name
//        case description
//        case sets
//        case tests
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(description, forKey: .description)
//        try container.encode(sets, forKey: .sets)
//        try container.encode(tests, forKey: .tests)
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        name = try values.decode(String.self, forKey: .name)
//        description = try values.decode(String.self, forKey: .description)
//        tests = try values.decode([Test].self, forKey: .tests)
//        sets = try values.decode([StudySet].self, forKey: .sets)
//
//    }
//}
