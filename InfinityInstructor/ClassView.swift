//
//  ClassView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct ClassView: View {
    var studyClass : Class
    
    var body: some View {
        VStack {
            Text("\(studyClass.name)")
                .font(.largeTitle)
            StudyRow(sets: orderSets(studyClass: self.studyClass), units: studyClass.units)
            TestList(tests: getTests(classes: [studyClass]))
            UnitRow(units: studyClass.units)
            
        }
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        let set1 = StudySet(id: 0, name: "Quadratics", description: "", score: 1, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2),RegularCard(id: 1, front: "Vertical Shift", back: "This is what happens when you change k. It raises or lowers the graph.", score: 3),RegularCard(id: 2, front: "Zeros of a function", back: "The x-values where a function crosses the x-axis ", score: 1)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 23343))
        let set2 = StudySet(id: 1, name: "1-variable Equations", description: "", score: 3, date: Date(timeIntervalSinceNow: 300), array: [MultipleChoiceCard(id: 0, front: "2x = 6 ", correct: "x = 3", score: 2, incorrectOptions: ["x=2", "x=-2","x=-3"]),MultipleChoiceCard(id: 1, front: "2x + 4 = 0", correct: "x=-2", score: 3, incorrectOptions: ["2", "4","-4"]),MultipleChoiceCard(id: 2, front: "x-6 = 0", correct: "6", score: 1, incorrectOptions: ["-6", "3","5"])], setType: .questionSet, nextDate: Date(timeIntervalSinceNow: 4034323232343))
        let set3 = StudySet(id: 2, name: "Linear", description: "", score: 2, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Slope Intercept Form", back: "y=mx+b", score: 2),RegularCard(id: 1, front: "Point-slope form", back: "y - y1 = m(x-x1)", score: 3),RegularCard(id: 2, front: "y-intercept", back: "the point where the equation crosses the y-axis", score: 1)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 3232234343))
        let studyClass = Class(id: 0, name: "Algebra", description: "Sandwich", units: [Unit(id: 0, name: "Quadratics", description: "", tests: [Test(id: 0, name: "Quadratics Unit Test", description: "", value: 1, sets: [set1,set2,set3], date: Date(timeIntervalSinceNow: -20))], sets: [set1,set2,set3])])
        return ClassView(studyClass: studyClass)
    }
}
