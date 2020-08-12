//
//  AddClassView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct AddClassView: View {
    @Binding var isShowing: Bool
    var body: some View {
        Text("Add Class")
        .onDisappear() { self.isShowing = false }
    }
}

struct AddClassView_Previews: PreviewProvider {
    static var previews: some View {
        AddClassView(isShowing: .constant(true))
    }
}
