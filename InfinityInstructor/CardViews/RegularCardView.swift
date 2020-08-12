//
//  RegularCardView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/10/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct RegularCardView: View {
    
    @Binding var flipped : Bool
    var card : RegularCard
    
    var body: some View {
        let flipDegrees = flipped ? 180.0 : 0
        return ZStack() {
            Text(card.front).padding(.horizontal).placedOnCard(Color.white).flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
            Text(card.back).padding(.horizontal).placedOnCard(scoreToColor(score: card.score)).flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
        }
        .animation(.easeInOut(duration: 0.5))
        .onTapGesture { self.flipped.toggle() }
    }
}

struct RegularCardView_Previews: PreviewProvider {
    static var previews: some View {
        RegularCardView(flipped: .constant(false), card: RegularCard(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2))
    }
}
