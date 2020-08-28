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
        ScrollView {
            VStack {
                Text("\(studyClass.name)")
                    .font(.largeTitle)
//                StudyRow(sets: orderSets(studyClass: self.studyClass), units: studyClass.units)
                TestList(tests: getTests(classes: [studyClass]))
                UnitRow(units: studyClass.units)
                
            }
        }
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        return ClassView(studyClass: Constants.studyClass1)
    }
}
