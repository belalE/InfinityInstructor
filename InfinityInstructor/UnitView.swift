//
//  UnitView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct UnitView: View {
    @Binding var unit: Unit
    @State var pushed: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("\(unit.name)")
                    .font(.largeTitle)
                StudyRow(sets: $unit.sets,units: .constant([unit]))
                //need to fix
                TestList(tests: unit.tests)
                
            }
        }
    }
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        return UnitView(unit: .constant(Constants.unit1))
        
    }
}
