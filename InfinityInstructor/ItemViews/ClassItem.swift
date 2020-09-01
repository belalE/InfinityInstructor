//
//  ClassItem.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct ClassItem: View {
    @Binding var studyClass : Class
    
    var body: some View {
        NavigationLink(destination: ClassView(studyClass: $studyClass)) {
            VStack(alignment: .leading) {
                HStack {
                    Text("\(studyClass.name)")
                        .foregroundColor(.black)
                }
                .frame(width: 200, height: 20, alignment: .center)
                Text("Last studied: \(getEarliestDate(studyClass: studyClass))")
                .foregroundColor(.black)
                Text(verbatim: "Next Test: \(getEarliestTestDate(studyClass: studyClass))")
                .foregroundColor(.black)
            }
            .frame(width: 250, height: 150, alignment: .center)
            .background(
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 4)
                    )
                )

        }
    }
}

struct ClassItem_Previews: PreviewProvider {
    static var previews: some View {
        return ClassItem(studyClass: .constant(Constants.studyClass1))
    }
}
