//
//  Functions.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/13/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation
import SwiftUI

func hasTest(set: StudySet, units: [Unit]) -> String {
    for unit in units {
        for test in unit.tests {
            for testSet in test.sets {
                if testSet == set  {
                    return test.date.toString(dateFormat: "MM/dd/YYYY")
                }
            }
        }
    }
    return "No Test"
}

func getUnits(classes: [Class]) -> [Unit] {
    var units = [Unit]()
    for studyClass in classes {
        for unit in studyClass.units {
            units.append(unit)
        }
    }
    return units
}

func scoreToColor(score: Int) -> Color {
    if score == 0 {
        return Color.gray
    } else if score == 1 {
        return Color.red
    } else if score == 2 {
        return Color.yellow
    }
    return Color.green
}

func getSets(classes: [Class]) -> [StudySet] {
    var setArray = [StudySet]()
    for studyClass in classes {
        for unit in studyClass.units {
            for set in unit.sets {
                setArray.append(set)
            }
        }
    }
    return setArray
}

func getTests(classes: [Class]) -> [Test] {
    var testArray = [Test]()
    for studyClass in classes {
        for unit in studyClass.units {
            for test in unit.tests {
                testArray.append(test)
            }
        }
    }
    return testArray
}


func getEarliestDate(studyClass: Class) -> String {
    var date : Date = studyClass.units[0].sets[0].date
    for unit in studyClass.units {
        for set in unit.sets {
            if set.date < date {
                date = set.date
            }
        }
    }
    return date.toString(dateFormat: "MM/dd/YYYY") 
}

func getEarliestDateFromUnit(unit: Unit) -> String {
    var date : Date = unit.sets[0].date
    for set in unit.sets {
        if set.date < date {
            date = set.date
        }
    }
    return date.toString(dateFormat: "MM/dd/YYYY")
}

func getEarliestTestDate(studyClass: Class) -> String {
    let tests = getTests(classes: [studyClass])
    var finalTest = tests[0]
    for test in tests {
        if test.date < finalTest.date {
            finalTest = test
        }
    }
    return finalTest.date.toString(dateFormat: "MM/dd/YYYY")
}

func getEarliestTestDateFromUnit(unit: Unit) -> String {
    let tests = unit.tests
    var finalTest = tests[0]
    for test in tests {
        if test.date < finalTest.date {
            finalTest = test
        }
    }
    return finalTest.date.toString(dateFormat: "MM/dd/YYYY")
}

func setImage(set: StudySet) -> String {
    return "pencil.circle.fill"
}
