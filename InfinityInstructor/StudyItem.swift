//
//  StudyItem.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/13/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct StudyItem: View {
    var set : StudySet
    var units : [Unit]
    
    var body: some View {
        NavigationLink(destination: SetView(set: set)) {
            VStack(alignment: .leading) {
                    HStack {
                        Text(set.name)
                            .foregroundColor(.black)
                        Image(systemName: setImage(set: set))
                        .foregroundColor(.black)
                    }
                    .frame(width: 200, height: 20, alignment: .center)
                    Text("Last studied: \(set.date.toString(dateFormat: "MM/dd/YYYY"))")
                        .foregroundColor(.black)
                    Text(verbatim: "Test: \(hasTest(set: set, units: units))")
                        .foregroundColor(.black)
                }
                .frame(width: 250, height: 150, alignment: .center)
            .background(
                Rectangle()
                    .foregroundColor(scoreToColor(score: set.score))
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 4)
                    )
                )

        }
    }
}

struct StudyItem_Previews: PreviewProvider {
    static var previews: some View {
        let set = StudySet(id: 0, name: "Quadratics", description: "", score: 3, date: Date(timeIntervalSinceNow: 300), array: [Card(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2, incorrectOptions: nil, cardType: .factCard),Card(id: 1, front: "Vertical Shift", back: "This is what happens when you change k. It raises or lowers the graph.", score: 3, incorrectOptions: nil, cardType: .factCard),Card(id: 2, front: "Zeros of a function", back: "The x-values where a function crosses the x-axis ", score: 1, incorrectOptions: nil, cardType: .factCard)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 23232131322))
        let classes = [Class(id: 1, name: "Algebra", description: "Sandwich", units: [Unit(id: 0, name: "Quadratics", description: "", tests: [Test(id: 0, name: "Quadratics Unit Test", description: "", sets: [set], date: Date(timeIntervalSinceNow: -20))], sets: [set])])]
        return StudyItem(set: set, units: getUnits(classes: classes))
    }
}
