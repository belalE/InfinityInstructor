//
//  NumberedCardView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/10/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct NumberedCardView: View {
    @Binding var flipped : Bool
    var card : NumberedCard
    var body: some View {
        let flipDegrees = flipped ? 180.0 : 0
        return ZStack() {
                    VStack {
                        Text(card.front).padding(.horizontal)
                        ForEach(0..<card.list.count) { i in
                            HStack {
                                Text("\(i + 1): ")
//                                TextField("Fill in", text: <#T##Binding<String>#>)
                            }
                        }
                    }
                    .placedOnCard(Color.white).flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
                    VStack {
                        ForEach(0..<card.list.count, id: \.self) { i in
                            Text("\(i+1): \(self.card.list[i])").padding(.horizontal)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .background(Color.blue.cornerRadius(5))
                        }
                    }.placedOnCard(scoreToColor(score: card.score)).flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
                    
                }
                .animation(.easeInOut(duration: 0.5))
                .onTapGesture { self.flipped.toggle() }
    }
}

struct NumberedCardView_Previews: PreviewProvider {
    static var previews: some View {
        NumberedCardView(flipped: .constant(false), card: NumberedCard(id: 0, front: "Levels of Organization within Organism", score: 1, list: ["cell","tissue","organ","Organ System"]))
    }
}
