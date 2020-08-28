//
//  UnitItem.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct UnitItem: View {
    var unit : Unit
    var body: some View {
        NavigationLink(destination: UnitView(unit: self.unit)) {
            VStack(alignment: .leading) {
                HStack {
                    Text("\(unit.name)")
                        .foregroundColor(.black)
                }
                .frame(width: 200, height: 20, alignment: .center)
                Text("Last studied: \(getEarliestDateFromUnit(unit: unit))")
                .foregroundColor(.black)
                Text(verbatim: "Next Test: \(getEarliestTestDateFromUnit(unit: unit))")
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

struct UnitItem_Previews: PreviewProvider {
    static var previews: some View {
        return UnitItem(unit: Constants.unit1)
    }
}
