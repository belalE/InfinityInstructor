//
//  UnitRow.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct UnitRow: View {
    var units: [Unit]
    var body: some View {
        VStack(alignment: .leading) {
                Text(verbatim: "Units")
                    .font(.headline)
                ScrollView(.horizontal){
                    HStack(alignment: .top) {
                        ForEach(units, id: \.id) { unit in
                            UnitItem(unit: unit)
                                .frame(width: 250)
                                .padding(.trailing,10)
                                .padding(.leading,10)
                        }
                    }
                    .frame(height: 200, alignment: .center)
                }
            }
        .padding()

    }
}

struct UnitRow_Previews: PreviewProvider {
    static var previews: some View {
        let set1 = StudySet(id: 0, name: "Quadratics", description: "", score: 1, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2),RegularCard(id: 1, front: "Vertical Shift", back: "This is what happens when you change k. It raises or lowers the graph.", score: 3),RegularCard(id: 2, front: "Zeros of a function", back: "The x-values where a function crosses the x-axis ", score: 1)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 23343))
        let set2 = StudySet(id: 1, name: "1-variable Equations", description: "", score: 3, date: Date(timeIntervalSinceNow: 300), array: [MultipleChoiceCard(id: 0, front: "2x = 6 ", correct: "x = 3", score: 2, incorrectOptions: ["x=2", "x=-2","x=-3"]),MultipleChoiceCard(id: 1, front: "2x + 4 = 0", correct: "x=-2", score: 3, incorrectOptions: ["2", "4","-4"]),MultipleChoiceCard(id: 2, front: "x-6 = 0", correct: "6", score: 1, incorrectOptions: ["-6", "3","5"])], setType: .questionSet, nextDate: Date(timeIntervalSinceNow: 4034323232343))
        let set3 = StudySet(id: 2, name: "Linear", description: "", score: 2, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Slope Intercept Form", back: "y=mx+b", score: 2),RegularCard(id: 1, front: "Point-slope form", back: "y - y1 = m(x-x1)", score: 3),RegularCard(id: 2, front: "y-intercept", back: "the point where the equation crosses the y-axis", score: 1)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 3232234343))
        
        let unit1 = Unit(id: 0, name: "Quadratics", description: "", tests: [Test(id: 0, name: "Quadratics Unit Test", description: "", value: 1, sets: [set1,set2,set3], date: Date(timeIntervalSinceNow: -20))], sets: [set1,set2,set3])
        let set4 = StudySet(id: 4, name: "Cells", description: "", score: 2, date: Date(timeIntervalSinceNow: 76971209), array: [RegularCard(id: 0, front: "prokaryotes", back: "no nucleus", score: 1),RegularCard(id: 1, front: "eukaryotes", back: "complex, and nucleus", score: 2)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 40343232323343))
        let set5 = StudySet(id: 5, name: "Organelles", description: "", score: 1, date: Date(timeIntervalSinceNow: 213233), array: [RegularCard(id: 0, front: "Mitochondria", back: "Powerhouse of the cell", score: 2),RegularCard(id: 1, front: "Ribosome", back: "makes proteins", score: 2)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 4034300999943))
        let set6 = StudySet(id: 6, name: "Evolution", description: "", score: 0, date: Date(timeIntervalSinceNow: 7078933), array: [RegularCard(id: 0, front: "Darwin Theory", back: "Mutatated animals live and reproduce as not mutated die", score: 1),RegularCard(id: 1, front: "Survival of the fittest", back: "animals best adapted live", score: 2)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 40343423232323))
        let unit2 = Unit(id: 0, name: "Quadratics", description: "", tests: [Test(id: 0, name: "Quadratics Unit Test", description: "", value: 2, sets: [set4,set5,set6], date: Date(timeIntervalSinceNow: -20))], sets: [set4,set5,set6])
        return UnitRow(units: [unit1, unit2])
    }
}
