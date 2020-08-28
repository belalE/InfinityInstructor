//
//  SetView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct SetView: View {
    var set : StudySet
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("\(set.name)")
                    .font(.largeTitle)
                Text("Last Studied: \(set.date.toString(dateFormat: "MM/dd/YYYY"))")
                Text("Score: \(String(set.score))")
                NavigationLink(destination: StudyView(set: set, index: 0, isReview: false)) {
                    Text("Study")
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(.blue)
                                .frame(width: 300, height: 40, alignment: .center)
                    )
                }
                NavigationLink(destination: StudyView(set: set, index: 0, isReview: true)) {
                    Text("Review")
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(.blue)
                                .frame(width: 300, height: 40, alignment: .center)
                    )
                }
                CardsView(cards: self.set.array)
            }
        }
    }
}

struct SetView_Previews: PreviewProvider {
    static var previews: some View {
        SetView(set: Constants.set1)
    }
}
