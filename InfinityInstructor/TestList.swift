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
        return TestList(tests: [Test(id: 0, name: "Quadratics Unit Test", description: "", value: 1, sets: [Constants.set1], date: Date(timeIntervalSinceNow: 200)),Test(id: 1, name: "Semester Exam", description: "", value: 3, sets: [Constants.set1,Constants.set2,Constants.set3], date: Date(timeIntervalSinceNow: 200000))])
    }
}
