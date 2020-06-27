//
//  Card.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation

struct Card  {
    var id: Int
    var front: String
    var back: String
    var score: Int
    var incorrectOptions : [String]?
    var cardType : CardType
}

extension Card : Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.back == rhs.back && lhs.score == rhs.score && lhs.incorrectOptions == rhs.incorrectOptions && lhs.cardType == rhs.cardType)
    }
}

enum CardType : Int {
    case factCard = 1
    case questionCard = 2
}

