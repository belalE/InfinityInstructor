//
//  HomeView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/13/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var classes: [Class]
    @State var pushed: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text(verbatim: "Infinity Instructor")
                    .font(.largeTitle)
                TestList(tests: getTests(classes: classes))
                ClassRow(classes: classes)
            }
        
        }
    }
    
    private func update() {
        orderClasses(classes: self.classes)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let set1 = StudySet(id: 0, name: "Quadratics", description: "", score: 1, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2),RegularCard(id: 1, front: "Vertical Shift", back: "This is what happens when you change k. It raises or lowers the graph.", score: 3),RegularCard(id: 2, front: "Zeros of a function", back: "The x-values where a function crosses the x-axis ", score: 1)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 23343))
        let set2 = StudySet(id: 1, name: "1-variable Equations", description: "", score: 3, date: Date(timeIntervalSinceNow: 300), array: [MultipleChoiceCard(id: 0, front: "2x = 6 ", correct: "x = 3", score: 2, incorrectOptions: ["x=2", "x=-2","x=-3"]),MultipleChoiceCard(id: 1, front: "2x + 4 = 0", correct: "x=-2", score: 3, incorrectOptions: ["2", "4","-4"]),MultipleChoiceCard(id: 2, front: "x-6 = 0", correct: "6", score: 1, incorrectOptions: ["-6", "3","5"])], setType: .questionSet, nextDate: Date(timeIntervalSinceNow: 4034323232343))
        let set3 = StudySet(id: 2, name: "Linear", description: "", score: 2, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Slope Intercept Form", back: "y=mx+b", score: 2),RegularCard(id: 1, front: "Point-slope form", back: "y - y1 = m(x-x1)", score: 3),RegularCard(id: 2, front: "y-intercept", back: "the point where the equation crosses the y-axis", score: 1)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 3232234343))
        let set4 = StudySet(id: 4, name: "Cells", description: "", score: 2, date: Date(timeIntervalSinceNow: 76971209), array: [RegularCard(id: 0, front: "prokaryotes", back: "no nucleus", score: 1),RegularCard(id: 1, front: "eukaryotes", back: "complex, and nucleus", score: 2)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 40343232323343))
        let set5 = StudySet(id: 5, name: "Organelles", description: "", score: 1, date: Date(timeIntervalSinceNow: 213233), array: [RegularCard(id: 0, front: "Mitochondria", back: "Powerhouse of the cell", score: 2),RegularCard(id: 1, front: "Ribosome", back: "makes proteins", score: 2)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 4034300999943))
        let set6 = StudySet(id: 6, name: "Evolution", description: "", score: 0, date: Date(timeIntervalSinceNow: 7078933), array: [RegularCard(id: 0, front: "Darwin Theory", back: "Mutatated animals live and reproduce as not mutated die", score: 1),RegularCard(id: 1, front: "Survival of the fittest", back: "animals best adapted live", score: 2)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 40343423232323))
        let studyClass2 = Class(id: 1, name: "Biology", description: "The study of life", units: [Unit(id: 0, name: "Quadratics", description: "", tests: [Test(id: 0, name: "Quadratics Unit Test", description: "", value: 3, sets: [set4,set5,set6], date: Date(timeIntervalSinceNow: -2202313))], sets: [set4,set5,set6])])
        let studyClass1 = Class(id: 4, name: "Algebra", description: "Sandwich", units: [Unit(id: 0, name: "Quadratics", description: "", tests: [Test(id: 0, name: "Quadratics Unit Test", description: "", value: 1, sets: [set1], date: Date(timeIntervalSinceNow: 23123212)),Test(id: 1, name: "Semester Exam", description: "", value: 2, sets: [set1, set2, set3], date: Date(timeIntervalSinceNow: 2023200))], sets: [set1,set2,set3])])
        let classes = [studyClass1, studyClass2]
        return HomeView(classes: classes)
    }
}
