//
//  Constants.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/13/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation
import SwiftUI

struct Constants {
    static let set1 = StudySet(id: 0, name: "Quadratics", description: "", score: 1, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Vertex Form", score: 2, back: "A form for a quadratic equation that shows the vertex."),RegularCard(id: 1, front: "Vertical Shift", score: 3, back: "This is what happens when you change k. It raises or lowers the graph."),RegularCard(id: 2, front: "Zeros of a function", score: 1, back: "The x-values where a function crosses the x-axis ")])
    static let mc1 = MultipleChoiceCard(id: 0, front: "2x = 6 ", score: 2, cardType: .multipleChoice, correct:  "x = 3", incorrectOptions: ["x=2", "x=-2","x=-3"])
    static let mc2 = MultipleChoiceCard(id: 1, front: "2x + 4 = 0", score: 3, cardType: .multipleChoice, correct:   "x=-2" , incorrectOptions: ["2", "4","-4"])
    static let mc3 = MultipleChoiceCard(id: 2, front:  "x-6 = 0", score: 3, cardType: .multipleChoice, correct: "6", incorrectOptions: ["-6", "3","5"])
    static let set2 = StudySet(id: 1, name: "1-variable Equations", description: "", score: 3, date: Date(timeIntervalSinceNow: 300), array: [mc1, mc2, mc3])
    static let set3 = StudySet(id: 2, name: "Linear", description: "", score: 2, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Slope Intercept Form", score: 2, back: "y=mx+b"),RegularCard(id: 1, front: "Point-slope form", score: 3, back: "y - y1 = m(x-x1)"),RegularCard(id: 2, front: "y-intercept", score: 1, back: "the point where the equation crosses the y-axis")])
    static let set4 = StudySet(id: 4, name: "Cells", description: "", score: 2, date: Date(timeIntervalSinceNow: 76971209), array: [RegularCard(id: 0, front: "prokaryotes", score: 1, back: "no nucleus"),RegularCard(id: 1, front: "eukaryotes", score: 2, back: "complex, and nucleus")])
    static let set5 = StudySet(id: 5, name: "Organelles", description: "", score: 1, date: Date(timeIntervalSinceNow: 213233), array: [RegularCard(id: 0, front: "Mitochondria", score: 2, back: "Powerhouse of the cell"),RegularCard(id: 1, front: "Ribosome", score: 2, back: "makes proteins")])
    static let set6 = StudySet(id: 6, name: "Evolution", description: "", score: 0, date: Date(timeIntervalSinceNow: 7078933), array: [RegularCard(id: 0, front: "Darwin Theory", score: 1, back: "Mutatated animals live and reproduce as not mutated die"),RegularCard(id: 1, front: "Survival of the fittest", score: 2, back: "animals best adapted live")])
    static let unit1 = Unit(id: 0, name: "Quadratics", description: "", tests: [Test(id: 0, name: "Quadratics Unit Test", description: "", value: 1, date: Date(timeIntervalSinceNow: -20), sets: [set1, set2, set3])], sets: [set1,set2,set3])
    static let unit2 = Unit(id: 0, name: "Cells", description: "", tests: [Test(id: 0, name: "Cells Unit Test", description: "", value: 2, date: Date(timeIntervalSinceNow: -20), sets: [set4, set5, set6])], sets: [set4,set5,set6])
    static let studyClass1 = Class(id: 0, name: "Algebra", description: "Sandwich", units: [Unit(id: 0, name: "Quadratics", description: "", tests: [Test(id: 0, name: "Quadratics Unit Test", description: "", value: 1, date: Date(timeIntervalSinceNow: -20), sets: [set1,set2,set3])], sets: [set1,set2,set3])])
    static let studyClass2 = Class(id: 1, name: "Biology", description: "The study of life", units: [unit2])
    static let diverseSet = StudySet(id: 0, name: "Quadratics", description: "", score: 1, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Vertex Form", score: 2, back: "A form for a quadratic equation that shows the vertex."),RegularCard(id: 1, front: "Vertical Shift", score: 3, back: "This is what happens when you change k. It raises or lowers the graph."),RegularCard(id: 2, front: "Zeros of a function", score: 1, back: "The x-values where a function crosses the x-axis "), MultipleChoiceCard(id: 0, front: "2x = 6 ", score: 2, cardType: .multipleChoice, correct: "x = 3", incorrectOptions: ["x=2", "x=-2","x=-3"]), BulletedCard(id: 0, front: "types of function", score: 1, bullets: ["linear","Quadratic","Exponential","Cubic", "Reciprocal","Square Root"]),NumberedCard(id: 0, front: "Levels of Organization within Organism", score: 1, list: ["cell","tissue","organ","Organ System"]), AcronymCard(id: 0, front: "PMAT", score: 2, meaning: ["Prophase","Metaphase","Anaphase","Telophase"]), ImageCard(id: 0, front: "Parabola", score: 2, image: UIImage(named: "parabola")!)])
}
