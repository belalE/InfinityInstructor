//
//  AcronymCardView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/10/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct AcronymCardView: View {
    @Binding var flipped : Bool
    @Environment(\.colorScheme) var colorScheme
    var card : AcronymCard
    
    var body: some View {
        let flipDegrees = flipped ? 180.0 : 0
        return ZStack {
            VStack {
                Text(card.front).padding(.horizontal).foregroundColor(.black)
                ForEach(card.meaning, id: \.self) { str in
                    HStack {
                        Text(String(str[str.startIndex]))
                                                TextField("Fill In", text: .constant(""))
                    }
                }
            }
            .placedOnCard(colorScheme == .dark ? Color.gray : Color.white).flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
            VStack {
                ForEach(card.meaning, id: \.self) { str in
                    
                    Text(str).padding(.horizontal)
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

struct AcronymCardView_Previews: PreviewProvider {
    static var previews: some View {
        AcronymCardView(flipped: .constant(false), card: AcronymCard(id: 0, front: "PMAT", score: 2, meaning: ["Prophase","Metaphase","Anaphase","Telophase"]))
    }
}
