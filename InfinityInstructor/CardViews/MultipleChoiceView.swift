//
//  MultipleChoiceView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/10/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct MultipleChoiceView: View {
    @Binding var flipped : Bool
    var card : MultipleChoiceCard
    
    var body: some View {
        let flipDegrees = flipped ? 180.0 : 0
        return ZStack() {
            VStack {
                Text(card.front).padding(.horizontal)
                ForEach(shuffleOptions(card: card), id: \.self) { str in
                    Text(verbatim: str)
                    .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(Color.blue.cornerRadius(5))
                        .padding([.top, .leading, .trailing])
                    
                    
                }
            }
            .placedOnCard(Color.white).flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
            VStack {
                Text(card.correct).padding(.horizontal)
                .foregroundColor(.white)
                .padding(.horizontal)
                .background(Color.blue.cornerRadius(5))
            }.placedOnCard(scoreToColor(score: card.score)).flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
            
        }
        .animation(.easeInOut(duration: 0.5))
        .onTapGesture { self.flipped.toggle() }
        
    }
}

struct MultipleChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleChoiceView(flipped: .constant(false), card: MultipleChoiceCard(id: 0, front: "2x = 6 ", correct: "x = 3", score: 2, incorrectOptions: ["x=2", "x=-2","x=-3"]))
    }
}
