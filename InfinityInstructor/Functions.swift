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
    if type == .factSet {
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

//func setNextDate(set: StudySet, units: [Unit]) {
//    var dayArray = [1,3,7,14,30]
//    var studySet = set
//    let diffInDays = Calendar.current.dateComponents([.day], from: set.date, to: Date(timeIntervalSinceNow: 0)).day
//    
//    // TestDate
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MM/dd/YYYY"
//    var testDate : Date?
//    let dateString = hasTest(set: studySet, units: units)
//    if dateString != "No Test" {
//        testDate = dateFormatter.date(from: dateString)
//    }
//    
//    //maybe array of dates
//    
//    if testDate != nil {
//        if studySet.score == 0 {
//            
//        } else if studySet.score == 1 {
//            
//        } else if studySet.score == 2 {
//            
//        } else if studySet.score == 3 {
//            
//        }
//    } else {
//        if studySet.score == 0 {
//            
//        } else if studySet.score == 1 {
//            
//        } else if studySet.score == 2 {
//            
//        } else if studySet.score == 3 {
//            
//        }
//    }
//    
//    
//}

//func setToRecommendation(set: StudySet) -> String {
//    if set.score == 1 {
//        return "Study again today."
//    } else if set.score == 2 {
//        return "Study again tomorrow"
//    } else if set.score == 3 {
//        return "Study again tomorrow"
//    }
//    return "Study again after a short break."
//}
//
//func rearrangeSets(sets: [StudySet],units: [Unit]) {
//    var initial = sets
//    var testArr = [StudySet]()
//    var redArr = [StudySet]()
//    var yellowArr = [StudySet]()
//    var greenArr = [StudySet]()
//    var greyArr = [StudySet]()
//
//    for set in initial {
//        if hasTest(set: set, units: units) != "No Test" {
//            testArr.append(set)
//        } else if set.score == 0 {
//            greyArr.append(set)
//        } else if set.score == 1 {
//            redArr.append(set)
//        } else if set.score == 2 {
//            yellowArr.append(set)
//        } else if set.score == 3 {
//            greenArr.append(set)
//        }
//    }
//    //hasTest, date, score
//    //try score system
//
//    greyArr = greyArr.sorted(by: { $0.date.compare($1.date) == .orderedAscending})
//    redArr = redArr.sorted(by: { $0.date.compare($1.date) == .orderedAscending})
//    yellowArr = yellowArr.sorted(by: { $0.date.compare($1.date) == .orderedAscending})
//    greenArr = greenArr.sorted(by: { $0.date.compare($1.date) == .orderedAscending})
//
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MM/dd/YYYY"
//
//    testArr = testArr.sorted(by: { dateFormatter.date(from: hasTest(set: $0, units: units))?.compare(dateFormatter.date(from: hasTest(set: $1, units: units))!) == .orderedAscending})
//
//    //red-green test now
//    //red-green test later
//    // red - green
//    //dateNext system
//
//
//}

func stringToDate(str: String)-> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/YYYY"
    var date = dateFormatter.date(from: str)!
    return date
}


func orderClasses(classes: [Class]) {
    var classArr = classes
    classArr = classArr.sorted(by: { stringToDate(str: getEarliestDate(studyClass: $0)).compare(stringToDate(str: getEarliestDate(studyClass: $1))) == .orderedAscending})
}

func orderSets(studyClass: Class) -> [StudySet] {
    var sets = getSets(classes: [studyClass])
    var tested = [StudySet]()
    for studySet in sets {
        if hasTest(set: studySet, units: studyClass.units) != "No Test" && stringToDate(str: hasTest(set: studySet, units: studyClass.units)).compare(Date(timeIntervalSinceNow: 200000)) == .orderedAscending {
            tested.append(studySet)
        }
    }
    var gray = [StudySet]()
    var red = [StudySet]()
    var yellow = [StudySet]()
    var green = [StudySet]()
    
    for studySet in tested {
        if studySet.score == 0 {
            gray.append(studySet)
        } else if studySet.score == 1 {
            red.append(studySet)
        } else if studySet.score == 2 {
            yellow.append(studySet)
        } else if studySet.score == 3 {
            green.append(studySet)
        }
    }
    var arr = gray + red + yellow + green
    return arr
}
