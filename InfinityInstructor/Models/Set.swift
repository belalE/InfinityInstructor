//
//  Set.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation

struct StudySet {
    var id: Int
    var name: String
    var description: String
    var score: Int
    var date : Date //change to dates
    var array : [Card]
    var setType : SetType
    var nextDate : Date
}

extension StudySet : Equatable {
    static func == (lhs: StudySet, rhs: StudySet) -> Bool {
        return (lhs.id == rhs.id && lhs.name == rhs.name && lhs.description == rhs.description && lhs.score == rhs.score && lhs.date == rhs.date && lhs.array == rhs.array && lhs.setType == rhs.setType && lhs.nextDate == rhs.nextDate)
    }
}

enum SetType : Int{
    case factSet = 1
    case questionSet = 2
}
