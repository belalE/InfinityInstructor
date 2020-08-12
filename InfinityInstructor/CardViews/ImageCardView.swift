//
//  ImageCardView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/10/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct ImageCardView: View {
    @Binding var flipped : Bool
    var card : ImageCard
    
    var body: some View {
        let flipDegrees = flipped ? 180.0 : 0
        return ZStack() {
            Text(card.front).padding(.horizontal).placedOnCard(Color.white).flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
            Image(card.image).padding(.horizontal).placedOnCard(scoreToColor(score: card.score)).flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0).aspectRatio(contentMode: .fit)
        }
        .animation(.easeInOut(duration: 0.5))
        .onTapGesture { self.flipped.toggle() }
    }
}

struct ImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardView(flipped: .constant(false), card: ImageCard(id: 0, front: "Parabola", score: 2, image: "parabola"))
    }
}
