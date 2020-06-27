//
//  TestList.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct TestList: View {
    var tests : [Test]
    
    var body: some View {
        VStack {
            Text("Tests")
            .font(.headline)
            VStack(alignment: .leading) {
                ForEach(tests,id: \.date) { test in
                    HStack {
                        Image(systemName: "circle.fill")
                        Text("\(test.name): \(test.date.toString(dateFormat: "MM/dd/YYYY"))")
                    }
                }
            }
        }
    }
}

struct TestList_Previews: PreviewProvider {
    static var previews: some View {
        let set1 = StudySet(id: 0, name: "Quadratics", description: "", score: 1, date: Date(timeIntervalSinceNow: 300), array: [Card(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2, incorrectOptions: nil, cardType: .factCard),Card(id: 1, front: "Vertical Shift", back: "This is what happens when you change k. It raises or lowers the graph.", score: 3, incorrectOptions: nil, cardType: .factCard),Card(id: 2, front: "Zeros of a function", back: "The x-values where a function crosses the x-axis ", score: 1, incorrectOptions: nil, cardType: .factCard)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 44343))
        let set2 = StudySet(id: 1, name: "1-variable Equations", description: "", score: 3, date: Date(timeIntervalSinceNow: 300), array: [Card(id: 0, front: "2x = 6 ", back: "x = 3", score: 2, incorrectOptions: ["x=2", "x=-2","x=-3"], cardType: .questionCard),Card(id: 1, front: "2x + 4 = 0", back: "x=-2", score: 3, incorrectOptions: ["2", "4","-4"], cardType: .questionCard),Card(id: 2, front: "x-6 = 0", back: "6", score: 1, incorrectOptions: ["-6", "3","5"], cardType: .questionCard)], setType: .questionSet, nextDate: Date(timeIntervalSinceNow: 4034232323343))
        let set3 = StudySet(id: 2, name: "Linear", description: "", score: 2, date: Date(timeIntervalSinceNow: 300), array: [Card(id: 0, front: "Slope Intercept Form", back: "y=mx+b", score: 2, incorrectOptions: nil, cardType: .factCard),Card(id: 1, front: "Point-slope form", back: "y - y1 = m(x-x1)", score: 3, incorrectOptions: nil, cardType: .factCard),Card(id: 2, front: "y-intercept", back: "the point where the equation crosses the y-axis", score: 1, incorrectOptions: nil, cardType: .factCard)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 40342323232343))
        return TestList(tests: [Test(id: 0, name: "Quadratics Unit Test", description: "", sets: [set1], date: Date(timeIntervalSinceNow: 200)),Test(id: 1, name: "Semester Exam", description: "", sets: [set1,set2,set3], date: Date(timeIntervalSinceNow: 200000))])
    }
}
