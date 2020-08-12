//
//  AddUnitView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct AddUnitView: View {
    @Binding var isShowing: Bool
    var body: some View {
        Text("Add Unit")
        .onDisappear() { self.isShowing = false }
    }
}

struct AddUnitView_Previews: PreviewProvider {
    static var previews: some View {
        AddUnitView(isShowing: .constant(true))
    }
}
