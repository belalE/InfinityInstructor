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
        VStack {
            Text("\(set.name)")
                .font(.largeTitle)
            Text("Last Studied: \(set.date.toString(dateFormat: "MM/dd/YYYY"))")
            Text("Score: \(String(set.score))")
            Text("Set Type: \(setTypeName(type: set.setType))")
            Spacer()
                .frame(height: 20)
            NavigationLink(destination: StudyView(set: set, index: 0)) {
                Text("Study")
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue)
                            .frame(width: 300, height: 40, alignment: .center)
                )
            }
           //need to add all cards
        }
    }
}

struct SetView_Previews: PreviewProvider {
    static var previews: some View {
        SetView(set: StudySet(id: 0, name: "Quadratics", description: "", score: 1, date: Date(timeIntervalSinceNow: 300), array: [Card(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2, incorrectOptions: nil, cardType: .conceptCard),Card(id: 1, front: "Vertical Shift", back: "This is what happens when you change k. It raises or lowers the graph.", score: 3, incorrectOptions: nil, cardType: .conceptCard),Card(id: 2, front: "Zeros of a function", back: "The x-values where a function crosses the x-axis ", score: 1, incorrectOptions: nil, cardType: .conceptCard)], setType: .conceptSet))
    }
}
