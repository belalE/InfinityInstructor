//
//  ReviewView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/9/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct ReviewView: View {
    
    var cards : [Card]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(cards, id: \.id) { card in
                    VStack {
                        VStack(spacing: 10.0) {
                            Text(verbatim: card.front)
                                .padding(.all)
                                .background(Color.white.cornerRadius(10))
                            Text(verbatim: card.front)
                                .padding(.all)
                                .background(Color.white.cornerRadius(10))
                        }
                        .padding(.all)
                        .background(scoreToColor(score: card.score).cornerRadius(15))
                        Spacer()
                            .frame(height: 30)
                    }
                
                }
            }
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(cards: [RegularCard(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2),RegularCard(id: 1, front: "Vertical Shift", back: "This is what happens when you change k. It raises or lowers the graph.", score: 3),RegularCard(id: 2, front: "Zeros of a function", back: "The x-values where a function crosses the x-axis ", score: 1)])
    }
}
