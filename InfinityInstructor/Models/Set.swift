//
//  Set.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation

class StudySet : Codable {
    var id: Int
    var name: String
    var description: String
    var score: Int
    var date : Date //change to dates
    var array : [Card]
    
    init(id: Int, name: String, description : String, score : Int, date : Date, array : [Card]) {
        self.id = id
        self.name = name
        self.description = description
        self.score = score
        self.date = date
        self.array = array
    }
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case description
        case score
        case date
        case array
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(score, forKey: .score)
        try container.encode(date, forKey: .date)
        try container.encode(array, forKey: .array)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        score = try values.decode(Int.self, forKey: .score)
        date = try values.decode(Date.self, forKey: .date)
        array = try values.decode([Card].self, forKey: .array)

    }
}


//extension StudySet : Equatable {
//    static func == (lhs: StudySet, rhs: StudySet) -> Bool {
//        return (lhs.id == rhs.id && lhs.name == rhs.name && lhs.description == rhs.description && lhs.score == rhs.score && lhs.date == rhs.date && lhs.array == rhs.array && lhs.setType == rhs.setType && lhs.nextDate == rhs.nextDate)
//    }
//}

enum SetType : Int{
    case factSet = 1
    case questionSet = 2
}

//extension Array where Self == Array<Card> {
//    static func == (lhs: Array<Card>, rhs: Array<Card>) -> Bool {
//        return (lhs == rhs)
//    }
//}
