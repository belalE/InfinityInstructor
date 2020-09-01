//
//  StudyItem.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/13/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct StudyItem: View {
    @Binding var set : StudySet
    @Binding var units : [Unit]
    
    var body: some View {
        NavigationLink(destination: SetView(set: $set)) {
            VStack(alignment: .leading) {
                    HStack {
                        Text(set.name)
                            .foregroundColor(.black)
                        Image(systemName: setImage(set: set))
                        .foregroundColor(.black)
                    }
                    .frame(width: 200, height: 20, alignment: .center)
                    Text("Last studied: \(set.date.toString(dateFormat: "MM/dd/YYYY"))")
                        .foregroundColor(.black)
                    Text(verbatim: "Test: \(hasTest(set: set, units: units))")
                        .foregroundColor(.black)
                }
                .frame(width: 250, height: 150, alignment: .center)
            .background(
                Rectangle()
                    .foregroundColor(scoreToColor(score: set.score))
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 4)
                    )
                )

        }
    }
}

struct StudyItem_Previews: PreviewProvider {
    static var previews: some View {
        return StudyItem(set: .constant(Constants.set1), units: .constant([Constants.unit1, Constants.unit2]))
    }
}
