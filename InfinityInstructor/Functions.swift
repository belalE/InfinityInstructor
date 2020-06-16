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
    if set.score == 0 {
        return "pencil.circle.fill"
    } else if set.score == 1 {
        return "book.fill"
    } else if set.score == 2 {
        return "briefcase.fill"
    }
    return "lock.circle.fill"
}

func setTypeName(type: SetType) -> String {
    if type == .conceptSet {
        return "Concepts"
    } else if type == .factSet {
        return "Facts"
    }
    return "Questions"
}

func shuffleOptions(card: Card) -> [String] {
    var array = [String]()
    array.append(card.back)
    if card.incorrectOptions != nil {
        for option in card.incorrectOptions! {
            array.append(option)
        }
    }
    array.shuffle()
    return array
}

func rearrangeSet(set: StudySet) {
    var finalArr = set.array
    var redSet = [Card]()
    var yellowSet = [Card]()
    var greenSet = [Card]()
    var greySet = [Card]()
    for card in set.array {
        if card.score == 0 {
            greySet.append(card)
        } else if card.score == 1 {
            redSet.append(card)
        } else if card.score == 2 {
            yellowSet.append(card)
        } else {
            greenSet.append(card)
        }
    }
    finalArr = redSet + yellowSet + greenSet
}

func numColor(set: StudySet, color: Int) -> String {
    var count = 0
    for card in set.array {
        if card.score == color {
            count += 1
        }
    }
    return String(count)
}

func avgScore(set: StudySet) {
    var score = set.score
    var count = 0
    for card in set.array {
        count += card.score
    } 
    score = count / set.array.count
}
