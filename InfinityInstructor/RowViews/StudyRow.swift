//
//  StudyRow.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct StudyRow: View {
    var sets : [StudySet]
    var units : [Unit]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(verbatim: "Need To Study")
                .font(.headline)
            ScrollView(.horizontal){
                HStack(alignment: .top) {
                    ForEach(sets, id: \.id) { set in //fix order
                        StudyItem(set: set, units: self.units)
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

struct StudyRow_Previews: PreviewProvider {
    static var previews: some View {
        return StudyRow(sets: [Constants.set1,Constants.set2, Constants.set3, Constants.set4, Constants.set5, Constants.set6], units: [Constants.unit1, Constants.unit2])
    }
}
