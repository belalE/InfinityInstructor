//
//  ClassRow.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct ClassRow: View {
    @Binding var classes : [Class]
    var body: some View {
        VStack(alignment: .leading) {
                Text(verbatim: "Classes")
                    .font(.headline)
                ScrollView(.vertical){
                    VStack(alignment: .center) {
                        ForEach(classes.indices) { idx in
                            ClassItem(studyClass: self.$classes[idx])
                                .frame(width: 250)
                                .padding(.bottom,10)
                                .padding(.top,10)
                        }
                    }
//                    .frame(height: 200, alignment: .center)
                }
            }
        .padding()
    }
}

struct ClassRow_Previews: PreviewProvider {
    static var previews: some View {
        return ClassRow(classes: .constant([Constants.studyClass1,Constants.studyClass2]))
    }
}
