//
//  AddTestView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct AddTestView: View {
    @Binding var isShowing: Bool
    var body: some View {
        Text("Add Test")
        .onDisappear() { self.isShowing = false }
    }
}

struct AddTestView_Previews: PreviewProvider {
    static var previews: some View {
        AddTestView(isShowing: .constant(true))
    }
}
