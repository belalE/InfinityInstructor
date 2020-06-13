//
//  Card.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation

protocol Card {
    var id: Int { get set }
    var front: String { get set }
    var type: CardType { get set }
    var back: String { get set }
    var score: Int { get set}
}

enum CardType {
    case concept
    case question
    case fact
}

struct ConceptCard : Card {
    var id: Int
    var front: String
    var type : CardType = .concept
    var back : String
    var score: Int
}

struct FactCard : Card{
    var id: Int
    var front: String
    var type : CardType = .fact
    var back : String
    var score: Int
}

struct QuestionCard : Card{
    var id: Int
    var front: String
    var type : CardType = .fact
    var back : String
    var incorrectOptions : [String]
    var score: Int
}
