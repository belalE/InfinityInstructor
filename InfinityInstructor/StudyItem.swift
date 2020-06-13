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
    
    var body: some View {
        VStack {
            HStack {
                Text(set.name)
                Image(systemName: "pencil.circle.fill")
            }
            Text("Last studied: \(set.date.toString(dateFormat: "mm/dd/yyyy"))")
            Text(verbatim: "Test: \("fart")")
        }
    }
}

struct StudyItem_Previews: PreviewProvider {
    static var previews: some View {
        StudyItem(set: ConceptSet(id: 0, name: "Quadratics", description: "", score: 0, array: [ConceptCard(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2), ConceptCard(id: 1, front: "Vertical Shift", back: "This is what happens when you change k. It raises or lowers the graph.", score: 3), ConceptCard(id: 2, front: "Zeros of a function", back: "The x-values where a function crosses the x-axis ", score: 1)], date: Date(timeIntervalSinceNow: -200)))
    }
}
