//
//  CheckListView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/27/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct CheckListView: View {

    @State var checkListData : [CheckListItem]
    var body: some View {
        ForEach(self.checkListData, id: \.id) { item in
            CheckView(isChecked: item.isChecked, set: item.set)
        }
        .font(.title)
    }
}

struct CheckListView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView(checkListData: getChecklistArray(sets: Constants.unit1.sets + Constants.unit2.sets))
    }
}
