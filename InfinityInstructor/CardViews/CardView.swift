//
//  CardView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @Binding var card : Card
    @Binding var flipped : Bool
    
    var body: some View {
        if card.cardType == .regular {
            print(card.cardType)
            return AnyView(RegularCardView(flipped: self.$flipped,card: card as! RegularCard))
        } else if card.cardType == .multipleChoice {
            return AnyView(MultipleChoiceView(flipped: self.$flipped,card: card as! MultipleChoiceCard))
        } else if card.cardType == .numbered {
            return AnyView(NumberedCardView(flipped: self.$flipped,card: card as! NumberedCard))
        }  else if card.cardType == .bulleted {
            return AnyView(BulletedCardView(flipped: self.$flipped,card: card as! BulletedCard))
        }  else if card.cardType == .acronym {
            return AnyView(AcronymCardView(flipped: self.$flipped,card: card as! AcronymCard))
        }
        return AnyView(ImageCardView(flipped: self.$flipped,card: card as! ImageCard))
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .constant(MultipleChoiceCard(id: 0, front: "2x = 6 ", score: 2, cardType: .multipleChoice, correct: "x = 3", incorrectOptions: ["x=2", "x=-2","x=-3"])), flipped: .constant(false))
    }
}
