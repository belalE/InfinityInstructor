//
//  Card.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation
import SwiftUI

protocol Card {
    var id: Int { get set }
    var front: String { get set }
    var score: Int { get set }
    var cardType : CardType { get set }
    
}

//extension Card  where Self: Equatable {
//    static func == (lhs: Card, rhs: Card) -> Bool {
//        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType)
//    }
//}

enum CardType {
    case regular
    case multipleChoice
    case numbered
    case bulleted
    case acronym
    case image
}

struct RegularCard : Card {
    var id: Int
    var front: String
    var back: String
    var score: Int
    var cardType: CardType = .regular
}

extension RegularCard : Equatable {
    static func == (lhs: RegularCard, rhs: RegularCard) -> Bool {
        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.back == rhs.back)
    }
}

struct MultipleChoiceCard : Card {
    var id: Int
    var front: String
    var correct : String
    var score: Int
    var incorrectOptions : [String]
    var cardType: CardType = .multipleChoice
}

extension MultipleChoiceCard : Equatable {
    static func == (lhs: MultipleChoiceCard, rhs: MultipleChoiceCard) -> Bool {
        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.correct == rhs.correct && lhs.incorrectOptions == rhs.incorrectOptions)
    }
}

struct BulletedCard : Card {
    var id: Int
    var front: String
    var score: Int
    var cardType: CardType = .bulleted
    var bullets : [String]
}

extension BulletedCard : Equatable {
    static func == (lhs: BulletedCard, rhs: BulletedCard) -> Bool {
        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.bullets == rhs.bullets)
    }
}

struct NumberedCard : Card {
    var id: Int
    var front: String
    var score: Int
    var list : [String]
    var cardType: CardType = .numbered
}

extension NumberedCard : Equatable {
    static func == (lhs: NumberedCard, rhs: NumberedCard) -> Bool {
        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.list == rhs.list)
    }
}

struct AcronymCard : Card {
    var id: Int
    var front: String
    var score: Int
    var meaning : [String]
    var cardType: CardType = .acronym
}

extension AcronymCard : Equatable {
    static func == (lhs: AcronymCard, rhs: AcronymCard) -> Bool {
        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.meaning == rhs.meaning)
    }
}


struct ImageCard : Card {
    var id: Int
    var front: String
    var score: Int
    var image : UIImage
    var cardType: CardType = .image
}

extension ImageCard : Equatable {
    static func == (lhs: ImageCard, rhs: ImageCard) -> Bool {
        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.image == rhs.image)
    }
}
