//
//  Set.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation

protocol StudySet {
    var id: Int { get set }
    var name: String { get set }
    var description: String { get set }
    var score: Int { get set }
    var date : Date { get set }
}

struct ConceptSet : StudySet {
    var id: Int
    var name: String
    var description: String
    var score: Int
    var array: [ConceptCard]
    var date : Date
}

struct FactSet : StudySet {
    var id: Int
    var name: String
    var description: String
    var score: Int
    var array: [FactCard]
    var date : Date
}

struct QuestionSet : StudySet {
    var id: Int
    var name: String
    var description: String
    var score: Int
    var array: [QuestionCard]
    var date : Date
}
