//
//  Card.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation
import SwiftUI

class Card : Codable{
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
    
    enum CodingKeys1 : String, CodingKey {
        case id
        case front
        case score
        case cardType
    }
    func encode(to encoder: Encoder) throws {
<<<<<<< Updated upstream
        var container = encoder.container(keyedBy: CodingKeys.self)
        print("encoding super")
=======
        var container = encoder.container(keyedBy: CodingKeys1.self)
>>>>>>> Stashed changes
        try container.encode(id, forKey: .id)
        try container.encode(front, forKey: .front)
        try container.encode(score, forKey: .score)
        try container.encode(cardType.rawValue, forKey: .cardType)
    }
    required init(from decoder: Decoder) throws {
<<<<<<< Updated upstream
        let values = try decoder.container(keyedBy: CodingKeys.self)
        print("decoding super")
=======
        let values = try decoder.container(keyedBy: CodingKeys1.self)
>>>>>>> Stashed changes
        self.id = try values.decode(Int.self, forKey: .id)
        self.front = try values.decode(String.self, forKey: .front)
        self.score = try values.decode(Int.self, forKey: .score)
        self.cardType = CardType(rawValue: try values.decode(String.self, forKey: .cardType))!
    }
}


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
    enum CodingKeys2 : String, CodingKey {
        case back
        case id
        case front
        case score
        case cardType
    }
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys2.self)
<<<<<<< Updated upstream
        print("encoding Regular")
=======
>>>>>>> Stashed changes
        try super.encode(to: encoder)
        try container.encode(back, forKey: .back)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys2.self)
<<<<<<< Updated upstream
        print("decoding regular")
=======
>>>>>>> Stashed changes
        back = try values.decode(String.self, forKey: .back)
        try super.init(from: decoder)

    }
}



class MultipleChoiceCard : Card {
    var correct : String
    var incorrectOptions : [String]
    init(id: Int, front: String, score: Int, cardType: CardType, correct: String, incorrectOptions : [String] ) {
        self.correct = correct
        self.incorrectOptions = incorrectOptions
        super.init(id: id, front: front, score: score, cardType: .multipleChoice)
        
    }
    
    enum CodingKeys3 : String, CodingKey {
        case correct
        case incorrectOptions
    }
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys3.self)
        try super.encode(to: encoder)
        try container.encode(correct, forKey: .correct)
        try container.encode(incorrectOptions, forKey: .incorrectOptions)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys3.self)
        correct = try values.decode(String.self, forKey: .correct)
        incorrectOptions = try values.decode([String].self, forKey: .incorrectOptions)
        try super.init(from: decoder)

    }
}

class BulletedCard : Card {
    var bullets : [String]
    
    init(id: Int, front: String, score: Int, bullets : [String]) {
        self.bullets = bullets
        super.init(id: id, front: front, score: score, cardType: .bulleted)
        
    }
    
    enum CodingKeys4 : String, CodingKey {
        case bullets
    }
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys4.self)
        try super.encode(to: encoder)
        try container.encode(bullets, forKey: .bullets)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys4.self)
        bullets = try values.decode([String].self, forKey: .bullets)
        try super.init(from: decoder)

    }
}


class NumberedCard : Card {
    var list : [String]
    init(id: Int, front: String, score: Int, list : [String]) {
        self.list = list
        super.init(id: id, front: front, score: score, cardType: .numbered)
        
    }
    
    enum CodingKeys5 : String, CodingKey {
        case list
    }
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys5.self)
        try super.encode(to: encoder)
        try container.encode(list, forKey: .list)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys5.self)
        list = try values.decode([String].self, forKey: .list)
        try super.init(from: decoder)

    }
}

class AcronymCard : Card {
    var meaning : [String]
    init(id: Int, front: String, score: Int, meaning : [String]) {
        self.meaning = meaning
        super.init(id: id, front: front, score: score, cardType: .acronym)
        
    }
    
    enum CodingKeys6 : String, CodingKey {
        case meaning
    }
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys6.self)
        try super.encode(to: encoder)
        try container.encode(meaning, forKey: .meaning)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys6.self)
        meaning = try values.decode([String].self, forKey: .meaning)
        try super.init(from: decoder)

    }
}


class ImageCard : Card {
    var image : UIImage
    init(id: Int, front: String, score: Int, image : UIImage) {
        self.image = image
        super.init(id: id, front: front, score: score, cardType: .image)
        
    }
    
    enum CodingKeys7 : String, CodingKey {
        case image
    }
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys7.self)
        try super.encode(to: encoder)
        try container.encode(image.pngData(), forKey: .image)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys7.self)
        let imageData = try values.decode(Data.self, forKey: .image)
        image = UIImage(data: imageData)!
        try super.init(from: decoder)

    }
    
}
