//
//  UnitRow.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct UnitRow: View {
    @Binding var units: [Unit]
    var body: some View {
        VStack(alignment: .leading) {
                Text(verbatim: "Units")
                    .font(.headline)
                ScrollView(.horizontal){
                    HStack(alignment: .top) {
                        ForEach(units.indices) { idx in
                            UnitItem(unit: self.$units[idx])
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

struct UnitRow_Previews: PreviewProvider {
    static var previews: some View {
        return UnitRow(units: .constant([Constants.unit1, Constants.unit2]))
    }
}
