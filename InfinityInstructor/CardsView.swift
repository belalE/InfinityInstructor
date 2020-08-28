//
//  CardsView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/9/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct CardsView: View {
    
    var cards : [Card]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(cards, id: \.id) { card in
                VStack<AnyView> {
                    if card.cardType == .regular {
                        
                        return AnyView(RegularReviewView(card: card as! RegularCard))
                    } else if card.cardType == .multipleChoice {
                        return AnyView(MCReviewView(card: card as! MultipleChoiceCard))
                    } else if card.cardType == .bulleted {
                        return AnyView(BulletedReviewView(card: card as! BulletedCard))
                    } else if card.cardType == .numbered {
                        return AnyView(NumberedReviewView(card: card as! NumberedCard))
                    } else if card.cardType == .acronym {
                        return AnyView(AcronymReviewView(card: card as! AcronymCard))
                    }
                    return AnyView(ImageReviewView(card: card as! ImageCard))
                }
            }
        }
        .padding()
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(cards: Constants.set1.array)
    }
}

struct RegularReviewView : View {
    
    var card : RegularCard
    
    var body: some View {
        VStack {
            VStack(spacing: 10.0) {
                Text(verbatim: card.front)
                    .padding(.all)
                    .background(Color.white.cornerRadius(10))
                Text(verbatim: card.back)
                    .padding(.all)
                    .background(Color.white.cornerRadius(10))
            }
            .padding(.all)
            .background(scoreToColor(score: card.score).cornerRadius(15))
        }
    }
}

struct MCReviewView : View {
    
    var card : MultipleChoiceCard
    
    var body: some View {
        VStack {
            VStack(spacing: 10.0) {
                Text(verbatim: card.front)
                    .padding(.all)
                    .background(Color.white.cornerRadius(10))
                Text(verbatim: card.correct)
                    .padding(.all)
                    .background(Color.green.cornerRadius(10))
            }
            .padding(.all)
            .background(scoreToColor(score: card.score).cornerRadius(15))
        }
    }
}

struct BulletedReviewView : View {
    
    var card : BulletedCard
    
    var body: some View {
        VStack {
            VStack(spacing: 10.0) {
                Text(verbatim: card.front)
                    .padding(.all)
                    .background(Color.white.cornerRadius(10))
                ForEach(self.card.bullets, id: \.self) { str in
                    HStack {
                        Image(systemName: "circle.fill").foregroundColor(.black)
                        Text(verbatim: str)
                        .padding(.all)
                        .background(Color.green.cornerRadius(10))
                    }
                    
                }
                
            }
            .padding(.all)
            .background(scoreToColor(score: card.score).cornerRadius(15))
        }
    }
}

struct NumberedReviewView : View {
    
    var card : NumberedCard
    
    var body: some View {
        VStack {
            VStack(spacing: 10.0) {
                Text(verbatim: card.front)
                    .padding(.all)
                    .background(Color.white.cornerRadius(10))
                ForEach(0..<self.card.list.count) { i in
                    HStack {
                        Text(verbatim: String(i))
                            Text(verbatim: self.card.list[i])
                        .padding(.all)
                        .background(Color.green.cornerRadius(10))
                    }
                }
                
            }
            .padding(.all)
            .background(scoreToColor(score: card.score).cornerRadius(15))
        }
    }
}

struct AcronymReviewView : View {
    
    var card : AcronymCard
    
    var body: some View {
        VStack {
            VStack(spacing: 10.0) {
                Text(verbatim: card.front)
                    .padding(.all)
                    .background(Color.white.cornerRadius(10))
                ForEach(0..<self.card.meaning.count) { i in
                    HStack {
                        Text(verbatim: String(i))
                            Text(verbatim: self.card.meaning[i])
                        .padding(.all)
                        .background(Color.green.cornerRadius(10))
                    }
                }
                
            }
            .padding(.all)
            .background(scoreToColor(score: card.score).cornerRadius(15))
        }
    }
}

struct ImageReviewView : View {
    
    var card : ImageCard
    
    var body: some View {
        VStack {
            VStack(spacing: 10.0) {
                Text(verbatim: card.front)
                    .padding(.all)
                    .background(Color.white.cornerRadius(10))
                Image(uiImage: card.image)
                    .aspectRatio(contentMode: .fit)
            }
            .padding(.all)
            .background(scoreToColor(score: card.score).cornerRadius(15))
        }
    }
}
