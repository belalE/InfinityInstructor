//
//  BulletedCardView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/10/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct BulletedCardView: View {
    @Binding var flipped : Bool
    @Environment(\.colorScheme) var colorScheme
    var card : BulletedCard
    
    var body: some View {
        let flipDegrees = flipped ? 180.0 : 0
        return ZStack() {
            VStack {
                Text(card.front).padding(.horizontal).foregroundColor(.black)
                ForEach(1..<card.bullets.count) { int in
                    HStack {
                        Image(systemName: "circle.fill")
                        TextField("Fill In", text: .constant(""))
                    }
                }
            }
            .placedOnCard(colorScheme == .dark ? Color.gray : Color.white).flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
            VStack(alignment: .leading) {
                ForEach(card.bullets, id: \.self) { bullet in
                    HStack {
                        Image(systemName: "circle.fill")
                        Text(bullet).padding(.horizontal)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                            .background(Color.blue.cornerRadius(5))
                    }
                }
            }.placedOnCard(scoreToColor(score: card.score)).flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
            
        }
        .animation(.easeInOut(duration: 0.5))
        .onTapGesture { self.flipped.toggle() }
    }
}

struct BulletedCardView_Previews: PreviewProvider {
    static var previews: some View {
        BulletedCardView(flipped: .constant(false), card: BulletedCard(id: 0, front: "types of function", score: 1, bullets: ["linear","Quadratic","Exponential","Cubic", "Reciprocal","Square Root"]))
    }
}
