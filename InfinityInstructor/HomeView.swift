//
//  HomeView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/13/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var classes: [Class]
    @State var pushed: Bool = false
    
    var body: some View {
        VStack {
            Text(verbatim: "Infinity Instructor")
                .font(.largeTitle)
            TestList(tests: getTests(classes: classes))
            ClassRow(classes: $classes)
        }
    }
    
    private func update() {
        orderClasses(classes: self.classes)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        return HomeView(classes: .constant([Constants.studyClass1, Constants.studyClass2]))
    }
}
