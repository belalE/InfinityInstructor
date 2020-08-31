//
//  Card.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation
import SwiftUI

class Card {
    var id: Int
    var front: String
    var score: Int
    var cardType : CardType
    
    init(id: Int, front : String, score: Int, cardType : CardType) {
        self.id = id
        self.front = front
        self.score = score
        self.cardType = cardType
    }
}


//extension Card  where Self: Equatable {
//    static func == (lhs: Card, rhs: Card) -> Bool {
//        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType)
//    }
//}

//extension Card : Codable {
//    enum CodingKeys : String, CodingKey {
//        case id
//        case front
//        case score
//        case cardType
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(front, forKey: .front)
//        try container.encode(score, forKey: .score)
//        try container.encode(cardType.rawValue, forKey: .cardType)
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        front = try values.decode(String.self, forKey: .front)
//        score = try values.decode(Int.self, forKey: .score)
//        cardType = CardType(rawValue: try values.decode(String.self, forKey: .cardType))!
//
//    }
//}

enum CardType : String {
    case regular = "regular"
    case multipleChoice = "multipleChoice"
    case numbered = "numbered"
    case bulleted = "bulleted"
    case acronym = "acronym"
    case image = "image"
}

class RegularCard : Card {
    var back: String
    
    init(id: Int, front : String, score: Int, back : String) {
        self.back = back
        super.init(id: id, front: front, score: score, cardType: .regular)
    }
}


//extension RegularCard : Equatable {
//    static func == (lhs: RegularCard, rhs: RegularCard) -> Bool {
//        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.back == rhs.back)
//    }
//}

//extension RegularCard : Codable {
//    enum CodingKeys : String, CodingKey {
//        case id
//        case front
//        case back
//        case score
//        case cardType
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(front, forKey: .front)
//        try container.encode(back, forKey: .back)
//        try container.encode(score, forKey: .score)
//        try container.encode(cardType.rawValue, forKey: .cardType)
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        front = try values.decode(String.self, forKey: .front)
//        back = try values.decode(String.self, forKey: .back)
//        score = try values.decode(Int.self, forKey: .score)
//        cardType = CardType(rawValue: try values.decode(String.self, forKey: .cardType))!
//
//    }
//}

class MultipleChoiceCard : Card {
    var correct : String
    var incorrectOptions : [String]
    init(id: Int, front: String, score: Int, cardType: CardType, correct: String, incorrectOptions : [String] ) {
        self.correct = correct
        self.incorrectOptions = incorrectOptions
        super.init(id: id, front: front, score: score, cardType: .multipleChoice)
        
    }
}

//extension MultipleChoiceCard : Equatable {
//    static func == (lhs: MultipleChoiceCard, rhs: MultipleChoiceCard) -> Bool {
//        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.correct == rhs.correct && lhs.incorrectOptions == rhs.incorrectOptions)
//    }
//}

//extension MultipleChoiceCard : Codable {
//    enum CodingKeys : String, CodingKey {
//        case id
//        case front
//        case correct
//        case score
//        case incorrectOptions
//        case cardType
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(front, forKey: .front)
//        try container.encode(correct, forKey: .correct)
//        try container.encode(score, forKey: .score)
//        try container.encode(incorrectOptions, forKey: .incorrectOptions)
//        try container.encode(cardType.rawValue, forKey: .cardType)
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        front = try values.decode(String.self, forKey: .front)
//        correct = try values.decode(String.self, forKey: .correct)
//        score = try values.decode(Int.self, forKey: .score)
//        incorrectOptions = try values.decode([String].self, forKey: .incorrectOptions)
//        cardType = CardType(rawValue: try values.decode(String.self, forKey: .cardType))!
//
//    }
//}

class BulletedCard : Card {
    var bullets : [String]
    
    init(id: Int, front: String, score: Int, bullets : [String]) {
        self.bullets = bullets
        super.init(id: id, front: front, score: score, cardType: .bulleted)
        
    }
}

//extension BulletedCard : Equatable {
//    static func == (lhs: BulletedCard, rhs: BulletedCard) -> Bool {
//        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.bullets == rhs.bullets)
//    }
//}

//extension BulletedCard : Codable {
//    enum CodingKeys : String, CodingKey {
//        case id
//        case front
//        case bullets
//        case correct
//        case score
//        case cardType
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(front, forKey: .front)
//        try container.encode(score, forKey: .score)
//        try container.encode(bullets, forKey: .bullets)
//        try container.encode(cardType.rawValue, forKey: .cardType)
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        front = try values.decode(String.self, forKey: .front)
//        score = try values.decode(Int.self, forKey: .score)
//        bullets = try values.decode([String].self, forKey: .bullets)
//        cardType = CardType(rawValue: try values.decode(String.self, forKey: .cardType))!
//
//    }
//}

class NumberedCard : Card {
    var list : [String]
    init(id: Int, front: String, score: Int, list : [String]) {
        self.list = list
        super.init(id: id, front: front, score: score, cardType: .numbered)
        
    }
}

//extension NumberedCard : Equatable {
//    static func == (lhs: NumberedCard, rhs: NumberedCard) -> Bool {
//        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.list == rhs.list)
//    }
//}

//extension NumberedCard : Codable {
//    enum CodingKeys : String, CodingKey {
//        case id
//        case front
//        case list
//        case score
//        case cardType
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(front, forKey: .front)
//        try container.encode(score, forKey: .score)
//        try container.encode(list, forKey: .list)
//        try container.encode(cardType.rawValue, forKey: .cardType)
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        front = try values.decode(String.self, forKey: .front)
//        score = try values.decode(Int.self, forKey: .score)
//        list = try values.decode([String].self, forKey: .list)
//        cardType = CardType(rawValue: try values.decode(String.self, forKey: .cardType))!
//    }
//}

class AcronymCard : Card {
    var meaning : [String]
    init(id: Int, front: String, score: Int, meaning : [String]) {
        self.meaning = meaning
        super.init(id: id, front: front, score: score, cardType: .acronym)
        
    }
}

//extension AcronymCard : Equatable {
//    static func == (lhs: AcronymCard, rhs: AcronymCard) -> Bool {
//        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.meaning == rhs.meaning)
//    }
//}

//extension AcronymCard : Codable {
//    enum CodingKeys : String, CodingKey {
//        case id
//        case front
//        case meaning
//        case score
//        case cardType
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(front, forKey: .front)
//        try container.encode(score, forKey: .score)
//        try container.encode(meaning, forKey: .meaning)
//        try container.encode(cardType.rawValue, forKey: .cardType)
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        front = try values.decode(String.self, forKey: .front)
//        score = try values.decode(Int.self, forKey: .score)
//        meaning = try values.decode([String].self, forKey: .meaning)
//        cardType = CardType(rawValue: try values.decode(String.self, forKey: .cardType))!
//
//    }
//}


class ImageCard : Card {
    var image : UIImage
    init(id: Int, front: String, score: Int, image : UIImage) {
        self.image = image
        super.init(id: id, front: front, score: score, cardType: .image)
        
    }

}

//extension ImageCard : Equatable {
//    static func == (lhs: ImageCard, rhs: ImageCard) -> Bool {
//        return (lhs.id == rhs.id && lhs.front == rhs.front && lhs.score == rhs.score && lhs.cardType == rhs.cardType && lhs.image == rhs.image)
//    }
//}

//extension ImageCard : Codable {
//    enum CodingKeys : String, CodingKey {
//        case id
//        case front
//        case image
//        case score
//        case cardType
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(front, forKey: .front)
//        try container.encode(score, forKey: .score)
//        try container.encode(image.pngData(), forKey: .image)
//        try container.encode(cardType.rawValue, forKey: .cardType)
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: .id)
//        front = try values.decode(String.self, forKey: .front)
//        score = try values.decode(Int.self, forKey: .score)
//        let imageData = try values.decode(Data.self, forKey: .image)
//        image = UIImage(data: imageData)!
//        cardType = CardType(rawValue: try values.decode(String.self, forKey: .cardType))!
//
//    }
//}
