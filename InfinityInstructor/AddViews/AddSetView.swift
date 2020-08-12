//
//  AddSetView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct AddSetView: View {
    @Binding var isShowing: Bool
    var body: some View {
        Text("Add Set")
        .onDisappear() { self.isShowing = false }
    }
}

struct AddSetView_Previews: PreviewProvider {
    static var previews: some View {
        AddSetView(isShowing: .constant(true))
    }
}
